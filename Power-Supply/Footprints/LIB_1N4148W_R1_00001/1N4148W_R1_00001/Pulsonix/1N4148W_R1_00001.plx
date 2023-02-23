PULSONIX_LIBRARY_ASCII "SamacSys ECAD Model"
//13039271/729305/2.49/2/3/Diode

(asciiHeader
	(fileUnits MM)
)
(library Library_1
	(padStyleDef "r130_80"
		(holeDiam 0)
		(padShape (layerNumRef 1) (padShapeType Rect)  (shapeWidth 0.8) (shapeHeight 1.3))
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
	(patternDef "SOD3816X135N" (originalName "SOD3816X135N")
		(multiLayer
			(pad (padNum 1) (padStyleRef r130_80) (pt -1.7, 0) (rotation 90))
			(pad (padNum 2) (padStyleRef r130_80) (pt 1.7, 0) (rotation 90))
		)
		(layerContents (layerNumRef 18)
			(attr "RefDes" "RefDes" (pt 0, 0) (textStyleRef "Normal") (isVisible True))
		)
		(layerContents (layerNumRef Courtyard_Top)
			(line (pt -2.6 1.65) (pt 2.6 1.65) (width 0.05))
		)
		(layerContents (layerNumRef Courtyard_Top)
			(line (pt 2.6 1.65) (pt 2.6 -1.65) (width 0.05))
		)
		(layerContents (layerNumRef Courtyard_Top)
			(line (pt 2.6 -1.65) (pt -2.6 -1.65) (width 0.05))
		)
		(layerContents (layerNumRef Courtyard_Top)
			(line (pt -2.6 -1.65) (pt -2.6 1.65) (width 0.05))
		)
		(layerContents (layerNumRef 28)
			(line (pt -1.325 0.8) (pt 1.325 0.8) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt 1.325 0.8) (pt 1.325 -0.8) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt 1.325 -0.8) (pt -1.325 -0.8) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt -1.325 -0.8) (pt -1.325 0.8) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt -1.325 0.15) (pt -0.675 0.8) (width 0.025))
		)
		(layerContents (layerNumRef 18)
			(line (pt -2.35 0.8) (pt 1.325 0.8) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt -1.325 -0.8) (pt 1.325 -0.8) (width 0.2))
		)
	)
	(symbolDef "1N4148W_R1_00001" (originalName "1N4148W_R1_00001")

		(pin (pinNum 1) (pt 0 mils 0 mils) (rotation 0) (pinLength 100 mils) (pinDisplay (dispPinName false)) (pinName (text (pt 140 mils -15 mils) (rotation 0]) (justify "Left") (textStyleRef "Normal"))
		))
		(pin (pinNum 2) (pt 600 mils 0 mils) (rotation 180) (pinLength 100 mils) (pinDisplay (dispPinName false)) (pinName (text (pt 460 mils -15 mils) (rotation 0]) (justify "Right") (textStyleRef "Normal"))
		))
		(line (pt 200 mils 100 mils) (pt 200 mils -100 mils) (width 6 mils))
		(line (pt 100 mils 0 mils) (pt 200 mils 0 mils) (width 6 mils))
		(line (pt 400 mils 0 mils) (pt 500 mils 0 mils) (width 6 mils))
		(poly (pt 200 mils 0 mils) (pt 400 mils 100 mils) (pt 400 mils -100 mils) (pt 200 mils 0 mils) (width 10  mils))
		(attr "RefDes" "RefDes" (pt 450 mils 200 mils) (justify Left) (isVisible True) (textStyleRef "Normal"))
		(attr "Type" "Type" (pt 450 mils 100 mils) (justify Left) (isVisible True) (textStyleRef "Normal"))

	)
	(compDef "1N4148W_R1_00001" (originalName "1N4148W_R1_00001") (compHeader (numPins 2) (numParts 1) (refDesPrefix D)
		)
		(compPin "1" (pinName "K") (partNum 1) (symPinNum 1) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "2" (pinName "A") (partNum 1) (symPinNum 2) (gateEq 0) (pinEq 0) (pinType Unknown))
		(attachedSymbol (partNum 1) (altType Normal) (symbolName "1N4148W_R1_00001"))
		(attachedPattern (patternNum 1) (patternName "SOD3816X135N")
			(numPads 2)
			(padPinMap
				(padNum 1) (compPinRef "1")
				(padNum 2) (compPinRef "2")
			)
		)
		(attr "Mouser Part Number" "241-1N4148W_R1_00001")
		(attr "Mouser Price/Stock" "https://www.mouser.co.uk/ProductDetail/Panjit/1N4148W_R1_00001?qs=sPbYRqrBIVnqVztCqPNVrw%3D%3D")
		(attr "Manufacturer_Name" "PANJIT")
		(attr "Manufacturer_Part_Number" "1N4148W_R1_00001")
		(attr "Description" "Diodes - General Purpose, Power, Switching /A2/TR/7"/HF/3K/SOD-123/SWI/SOD/USM-04/USM04-QI01/PJ///")
		(attr "<Hyperlink>" "")
		(attr "<Component Height>" "1.35")
		(attr "<STEP Filename>" "1N4148W_R1_00001.stp")
		(attr "<STEP Offsets>" "X=0;Y=0;Z=0")
		(attr "<STEP Rotation>" "X=0;Y=0;Z=0")
	)

)
