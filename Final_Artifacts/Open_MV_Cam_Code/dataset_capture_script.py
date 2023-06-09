# Edge Impulse - OpenMV Image Classification Example

import sensor, image, time, os, tf, uos, gc, pyb, ustruct
MIN_TRIGGER_THRESHOLD = -0.4
sensor.reset()                         # Reset and initialize the sensor.
sensor.set_pixformat(sensor.RGB565)    # Set pixel format to RGB565 (or GRAYSCALE)
sensor.set_framesize(sensor.QVGA)      # Set frame size to QVGA (320x240)

sensor.skip_frames(time=2000)
sensor.set_auto_whitebal(False) # Turn off white balance.

clock = time.clock() # Tracks FPS.
extra_fb = sensor.alloc_extra_fb(sensor.width(), sensor.height(), sensor.RGB565)

birdsthreshold = 0.55
led = pyb.LED(1)
led.off()
net = None
labels = None
net = None
labels = None
clock = time.clock()
print("About to save background image...")
sensor.skip_frames(time = 2000) # Give the user time to get ready.
extra_fb.replace(sensor.snapshot())
print("Saved background image!")

text = "1" #bird
text2= "0" #no bird
text3 = "2" #obstruct


#communication method (need to change)
data = ustruct.pack("<%ds" % len(text), text)
data2 = ustruct.pack("<%ds" % len(text2), text2)
data3 = ustruct.pack("<%ds" % len(text3), text3)
bus = pyb.I2C(2, pyb.I2C.SLAVE, addr=0x12)
bus.deinit() # Fully reset I2C device...
bus = pyb.I2C(2, pyb.I2C.SLAVE, addr=0x12)
print(data, " DATA BITS")
#print(data2, " DATA")

try:
    # load the model, alloc the model file on the heap if we have at least 64K free after loading
    net = tf.load("trained.tflite", load_to_fb=uos.stat('trained.tflite')[6] > (gc.mem_free() - (64*1024)))
except Exception as e:
    print(e)
    raise Exception('Failed to load "trained.tflite", did you copy the .tflite and labels.txt file onto the mass-storage device? (' + str(e) + ')')

try:
    labels = [line.rstrip('\n') for line in open("labels.txt")]
except Exception as e:
    raise Exception('Failed to load "labels.txt", did you copy the .tflite and labels.txt file onto the mass-storage device? (' + str(e) + ')')

clock = time.clock()


while(True):
    clock.tick()

    img = sensor.snapshot() # Take a picture and return the image.
    sim = img.get_similarity(extra_fb)


    # default settings just do one detection... change them to search the image...

    for obj in net.classify(img, min_scale=1.0, scale_mul=0.8, x_overlap=0.5, y_overlap=0.5):
        print("**********\nPredictions at [x=%d,y=%d,w=%d,h=%d]" % obj.rect())
        img.draw_rectangle(obj.rect())
        # This combines the labels and confidence values into a list of tuples
        predictions_list = list(zip(labels, obj.output()))

        for i in range(len(predictions_list)):
            print("%s = %f" % (predictions_list[i][0], predictions_list[i][1]))

    print(clock.fps(), "fps")

    idx = labels.index('bird')
    idx2 = labels.index('obstruct')

    if ((obj.output()[idx] > birdsthreshold) and (sim.min() < MIN_TRIGGER_THRESHOLD)):
        try:
            bus.send(ustruct.pack("<h", len(data)), timeout=100) # Send the len first (16-bits).
            try:
                bus.send(data, timeout=100) # Send the data second.
            except OSError as err:
                 pass # Don't care about errors - s+-o pass.
        # Note that there are 3 possible errors. A timeout error, a general purpose error, or
        # a busy error. The error codes are 116, 5, 16 respectively for "err.arg[0]".
        except OSError as err:
            pass

    elif (obj.output()[idx2] > birdsthreshold  ):
        try:
             bus.send(ustruct.pack("<h", len(data3)), timeout=100) # Send the len first (16-bits).
             try:
                bus.send(data3, timeout=100) # Send the data second.
             except OSError as err:
                 pass # Don't care about errors - s+-o pass.
        # Note that there are 3 possible errors. A timeout error, a general purpose error, or
        # a busy error. The error codes are 116, 5, 16 respectively for "err.arg[0]".
        except OSError as err:
            pass

    else:

            try:
                bus.send(ustruct.pack("<h", len(data2)), timeout=100) # Send the len first (16-bits).
                try:
                    bus.send(data2, timeout=100) # Send the data second.
                except OSError as err:
                    pass # Don't care about errors - so pass.
        # Note that there are 3 possible errors. A timeout error, a general purpose error, or
        # a busy error. The error codes are 116, 5, 16 respectively for "err.arg[0]".
            except OSError as err:
                pass






