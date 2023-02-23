SamacSys ECAD Model
8305528/729305/2.49/4/4/Bridge Rectifier

DESIGNSPARK_INTERMEDIATE_ASCII

(asciiHeader
	(fileUnits MM)
)
(library Library_1
	(padStyleDef "r150_90"
		(holeDiam 0)
		(padShape (layerNumRef 1) (padShapeType Rect)  (shapeWidth 0.900) (shapeHeight 1.500))
		(padShape (layerNumRef 16) (padShapeType Ellipse)  (shapeWidth 0) (shapeHeight 0))
	)
	(textStyleDef "Default"
		(font
			(fontType Stroke)
			(fontFace "Helvetica")
			(fontHeight 50 mils)
			(strokeWidth 5 mils)
		)
	)
	(patternDef "LMB12STP" (originalName "LMB12STP")
		(multiLayer
			(pad (padNum 1) (padStyleRef r150_90) (pt 2.050, 2.860) (rotation 0))
			(pad (padNum 2) (padStyleRef r150_90) (pt 2.050, -2.860) (rotation 0))
			(pad (padNum 3) (padStyleRef r150_90) (pt -2.050, -2.860) (rotation 0))
			(pad (padNum 4) (padStyleRef r150_90) (pt -2.050, 2.860) (rotation 0))
		)
		(layerContents (layerNumRef 18)
			(attr "RefDes" "RefDes" (pt 0.000, 0.245) (textStyleRef "Default") (isVisible True))
		)
		(layerContents (layerNumRef 28)
			(line (pt -2.525 2.4) (pt 2.525 2.4) (width 0.2))
		)
		(layerContents (layerNumRef 28)
			(line (pt 2.525 2.4) (pt 2.525 -2.4) (width 0.2))
		)
		(layerContents (layerNumRef 28)
			(line (pt 2.525 -2.4) (pt -2.525 -2.4) (width 0.2))
		)
		(layerContents (layerNumRef 28)
			(line (pt -2.525 -2.4) (pt -2.525 2.4) (width 0.2))
		)
		(layerContents (layerNumRef 30)
			(line (pt -3.525 5.1) (pt 3.525 5.1) (width 0.1))
		)
		(layerContents (layerNumRef 30)
			(line (pt 3.525 5.1) (pt 3.525 -4.61) (width 0.1))
		)
		(layerContents (layerNumRef 30)
			(line (pt 3.525 -4.61) (pt -3.525 -4.61) (width 0.1))
		)
		(layerContents (layerNumRef 30)
			(line (pt -3.525 -4.61) (pt -3.525 5.1) (width 0.1))
		)
		(layerContents (layerNumRef 18)
			(line (pt -1.2 2.4) (pt 1.2 2.4) (width 0.1))
		)
		(layerContents (layerNumRef 18)
			(line (pt -1.2 -2.4) (pt 1.2 -2.4) (width 0.1))
		)
		(layerContents (layerNumRef 18)
			(line (pt -2.525 1.8) (pt -2.525 -1.8) (width 0.1))
		)
		(layerContents (layerNumRef 18)
			(line (pt 2.525 1.8) (pt 2.525 -1.8) (width 0.1))
		)
		(layerContents (layerNumRef 18)
			(line (pt 2.05 4) (pt 2.05 4) (width 0.1))
		)
		(layerContents (layerNumRef 18)
			(arc (pt 2.05, 4.05) (radius 0.05) (startAngle 270) (sweepAngle 180.0) (width 0.1))
		)
		(layerContents (layerNumRef 18)
			(line (pt 2.05 4.1) (pt 2.05 4.1) (width 0.1))
		)
		(layerContents (layerNumRef 18)
			(arc (pt 2.05, 4.05) (radius 0.05) (startAngle 90.0) (sweepAngle 180.0) (width 0.1))
		)
	)
	(symbolDef "LMB12S-TP" (originalName "LMB12S-TP")

		(pin (pinNum 1) (pt 1000 mils 0 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 770 mils -25 mils) (rotation 0]) (justify "Right") (textStyleRef "Default"))
		))
		(pin (pinNum 2) (pt 1000 mils -100 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 770 mils -125 mils) (rotation 0]) (justify "Right") (textStyleRef "Default"))
		))
		(pin (pinNum 3) (pt 0 mils -100 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -125 mils) (rotation 0]) (justify "Left") (textStyleRef "Default"))
		))
		(pin (pinNum 4) (pt 0 mils 0 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -25 mils) (rotation 0]) (justify "Left") (textStyleRef "Default"))
		))
		(line (pt 200 mils 100 mils) (pt 800 mils 100 mils) (width 6 mils))
		(line (pt 800 mils 100 mils) (pt 800 mils -200 mils) (width 6 mils))
		(line (pt 800 mils -200 mils) (pt 200 mils -200 mils) (width 6 mils))
		(line (pt 200 mils -200 mils) (pt 200 mils 100 mils) (width 6 mils))
		(attr "RefDes" "RefDes" (pt 850 mils 300 mils) (justify Left) (isVisible True) (textStyleRef "Default"))

	)
	(compDef "LMB12S-TP" (originalName "LMB12S-TP") (compHeader (numPins 4) (numParts 1) (refDesPrefix BR)
		)
		(compPin "1" (pinName "+") (partNum 1) (symPinNum 1) (gateEq 0) (pinEq 0) (pinType Bidirectional))
		(compPin "2" (pinName "~_1") (partNum 1) (symPinNum 2) (gateEq 0) (pinEq 0) (pinType Bidirectional))
		(compPin "3" (pinName "~_2") (partNum 1) (symPinNum 3) (gateEq 0) (pinEq 0) (pinType Bidirectional))
		(compPin "4" (pinName "-") (partNum 1) (symPinNum 4) (gateEq 0) (pinEq 0) (pinType Bidirectional))
		(attachedSymbol (partNum 1) (altType Normal) (symbolName "LMB12S-TP"))
		(attachedPattern (patternNum 1) (patternName "LMB12STP")
			(numPads 4)
			(padPinMap
				(padNum 1) (compPinRef "1")
				(padNum 2) (compPinRef "2")
				(padNum 3) (compPinRef "3")
				(padNum 4) (compPinRef "4")
			)
		)
		(attr "Mouser Part Number" "833-LMB12S-TP")
		(attr "Mouser Price/Stock" "https://www.mouser.co.uk/ProductDetail/Micro-Commercial-Components-MCC/LMB12S-TP?qs=P1JMDcb91o7e1QBloAQ5ig%3D%3D")
		(attr "Manufacturer_Name" "Micro Commercial Components (MCC)")
		(attr "Manufacturer_Part_Number" "LMB12S-TP")
		(attr "Description" "Bridge Rectifiers 1A 20Vr 14Vrms 20V 30A Ifsm")
		(attr "Datasheet Link" "")
		(attr "Height" "1.71 mm")
	)

)
