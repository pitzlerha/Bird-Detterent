PULSONIX_LIBRARY_ASCII "SamacSys ECAD Model"
//179510/729305/2.49/3/3/Integrated Circuit

(asciiHeader
	(fileUnits MM)
)
(library Library_1
	(padStyleDef "r210_100"
		(holeDiam 0)
		(padShape (layerNumRef 1) (padShapeType Rect)  (shapeWidth 1) (shapeHeight 2.1))
		(padShape (layerNumRef 16) (padShapeType Ellipse)  (shapeWidth 0) (shapeHeight 0))
	)
	(padStyleDef "r585_490"
		(holeDiam 0)
		(padShape (layerNumRef 1) (padShapeType Rect)  (shapeWidth 4.9) (shapeHeight 5.85))
		(padShape (layerNumRef 16) (padShapeType Ellipse)  (shapeWidth 0) (shapeHeight 0))
	)
	(textStyleDef "Normal"
		(font
			(fontType Stroke)
			(fontFace "Helvetica")
			(fontHeight 1.27)
			(strokeWidth 0.127)
		)
	)
	(patternDef "TO228P972X240-3N" (originalName "TO228P972X240-3N")
		(multiLayer
			(pad (padNum 1) (padStyleRef r210_100) (pt -4.35, 2.28) (rotation 90))
			(pad (padNum 2) (padStyleRef r210_100) (pt -4.35, -2.28) (rotation 90))
			(pad (padNum 3) (padStyleRef r585_490) (pt 2.45, 0) (rotation 90))
		)
		(layerContents (layerNumRef 18)
			(attr "RefDes" "RefDes" (pt 0, 0) (textStyleRef "Normal") (isVisible True))
		)
		(layerContents (layerNumRef Courtyard_Top)
			(line (pt -2.088 -3.3) (pt 4.112 -3.3) (width 0.001))
		)
		(layerContents (layerNumRef Courtyard_Top)
			(line (pt 4.112 -3.3) (pt 4.112 3.3) (width 0.001))
		)
		(layerContents (layerNumRef Courtyard_Top)
			(line (pt 4.112 3.3) (pt -2.088 3.3) (width 0.001))
		)
		(layerContents (layerNumRef Courtyard_Top)
			(line (pt -2.088 3.3) (pt -2.088 -3.3) (width 0.001))
		)
		(layerContents (layerNumRef Courtyard_Top)
			(line (pt -5.65 -3.55) (pt 5.65 -3.55) (width 0.05))
		)
		(layerContents (layerNumRef Courtyard_Top)
			(line (pt 5.65 -3.55) (pt 5.65 3.55) (width 0.05))
		)
		(layerContents (layerNumRef Courtyard_Top)
			(line (pt 5.65 3.55) (pt -5.65 3.55) (width 0.05))
		)
		(layerContents (layerNumRef Courtyard_Top)
			(line (pt -5.65 3.55) (pt -5.65 -3.55) (width 0.05))
		)
		(layerContents (layerNumRef Courtyard_Top)
			(arc (pt 0, 0) (radius 0) (width 0.05))
		)
		(layerContents (layerNumRef Courtyard_Top)
			(line (pt 0 -0.5) (pt 0 0.5) (width 0.05))
		)
		(layerContents (layerNumRef Courtyard_Top)
			(line (pt -0.5 0) (pt 0.5 0) (width 0.05))
		)
		(layerContents (layerNumRef 28)
			(line (pt -2.037 -3.25) (pt 4.062 -3.25) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt 4.062 -3.25) (pt 4.062 3.25) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt 4.062 3.25) (pt -2.037 3.25) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt -2.037 3.25) (pt -2.037 -3.25) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt 4.062 -2.35) (pt 4.326 -2.35) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt 4.326 -2.35) (pt 4.863 -1.756) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt 4.863 -1.756) (pt 4.863 1.756) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt 4.863 1.756) (pt 4.327 2.35) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt 4.327 2.35) (pt 4.063 2.35) (width 0.025))
		)
		(layerContents (layerNumRef 18)
			(line (pt -0.85 -3.25) (pt -2.95 -3.25) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt -2.95 -3.25) (pt -2.95 3.25) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt -2.95 3.25) (pt -0.85 3.25) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(arc (pt -5.15, 3.3) (radius 0) (width 0.25))
		)
	)
	(symbolDef "L78M10ABDT-TR" (originalName "L78M10ABDT-TR")

		(pin (pinNum 1) (pt 0 mils 0 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -25 mils) (rotation 0]) (justify "Left") (textStyleRef "Normal"))
		))
		(pin (pinNum 2) (pt 0 mils -100 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -125 mils) (rotation 0]) (justify "Left") (textStyleRef "Normal"))
		))
		(pin (pinNum 3) (pt 1500 mils 0 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 1270 mils -25 mils) (rotation 0]) (justify "Right") (textStyleRef "Normal"))
		))
		(line (pt 200 mils 100 mils) (pt 1300 mils 100 mils) (width 6 mils))
		(line (pt 1300 mils 100 mils) (pt 1300 mils -200 mils) (width 6 mils))
		(line (pt 1300 mils -200 mils) (pt 200 mils -200 mils) (width 6 mils))
		(line (pt 200 mils -200 mils) (pt 200 mils 100 mils) (width 6 mils))
		(attr "RefDes" "RefDes" (pt 1350 mils 300 mils) (justify Left) (isVisible True) (textStyleRef "Normal"))
		(attr "Type" "Type" (pt 1350 mils 200 mils) (justify Left) (isVisible True) (textStyleRef "Normal"))

	)
	(compDef "L78M10ABDT-TR" (originalName "L78M10ABDT-TR") (compHeader (numPins 3) (numParts 1) (refDesPrefix IC)
		)
		(compPin "1" (pinName "INPUT") (partNum 1) (symPinNum 1) (gateEq 0) (pinEq 0) (pinType Output))
		(compPin "3" (pinName "OUTPUT") (partNum 1) (symPinNum 2) (gateEq 0) (pinEq 0) (pinType Power))
		(compPin "4" (pinName "GND_(TAB)") (partNum 1) (symPinNum 3) (gateEq 0) (pinEq 0) (pinType Input))
		(attachedSymbol (partNum 1) (altType Normal) (symbolName "L78M10ABDT-TR"))
		(attachedPattern (patternNum 1) (patternName "TO228P972X240-3N")
			(numPads 3)
			(padPinMap
				(padNum 1) (compPinRef "1")
				(padNum 2) (compPinRef "3")
				(padNum 3) (compPinRef "4")
			)
		)
		(attr "Mouser Part Number" "511-L78M10ABDT-TR")
		(attr "Mouser Price/Stock" "https://www.mouser.co.uk/ProductDetail/STMicroelectronics/L78M10ABDT-TR?qs=22WmWNTp1rr9tcUfF7JLAg%3D%3D")
		(attr "Manufacturer_Name" "STMicroelectronics")
		(attr "Manufacturer_Part_Number" "L78M10ABDT-TR")
		(attr "Description" "Voltage Regulator 10V 0.5A DPAK STMicroelectronics L78M10ABDT-TR, Single Linear Voltage Regulator, 500mA 10 V, +/-2%, 3-Pin DPAK")
		(attr "<Hyperlink>" "http://www.st.com/web/en/resource/technical/document/datasheet/CD00000447.pdf")
		(attr "<Component Height>" "2.4")
	)

)