SamacSys ECAD Model
440642/729305/2.49/2/3/Schottky Diode

DESIGNSPARK_INTERMEDIATE_ASCII

(asciiHeader
	(fileUnits MM)
)
(library Library_1
	(padStyleDef "r310_220"
		(holeDiam 0)
		(padShape (layerNumRef 1) (padShapeType Rect)  (shapeWidth 2.2) (shapeHeight 3.1))
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
	(patternDef "DIOM7959X250N" (originalName "DIOM7959X250N")
		(multiLayer
			(pad (padNum 1) (padStyleRef r310_220) (pt -3.5, 0) (rotation 0))
			(pad (padNum 2) (padStyleRef r310_220) (pt 3.5, 0) (rotation 0))
		)
		(layerContents (layerNumRef 18)
			(attr "RefDes" "RefDes" (pt 0, 0) (textStyleRef "Default") (isVisible True))
		)
		(layerContents (layerNumRef 30)
			(line (pt -4.85 3.36) (pt 4.85 3.36) (width 0.05))
		)
		(layerContents (layerNumRef 30)
			(line (pt 4.85 3.36) (pt 4.85 -3.36) (width 0.05))
		)
		(layerContents (layerNumRef 30)
			(line (pt 4.85 -3.36) (pt -4.85 -3.36) (width 0.05))
		)
		(layerContents (layerNumRef 30)
			(line (pt -4.85 -3.36) (pt -4.85 3.36) (width 0.05))
		)
		(layerContents (layerNumRef 28)
			(line (pt -3.97 2.952) (pt 3.97 2.952) (width 0.1))
		)
		(layerContents (layerNumRef 28)
			(line (pt 3.97 2.952) (pt 3.97 -2.952) (width 0.1))
		)
		(layerContents (layerNumRef 28)
			(line (pt 3.97 -2.952) (pt -3.97 -2.952) (width 0.1))
		)
		(layerContents (layerNumRef 28)
			(line (pt -3.97 -2.952) (pt -3.97 2.952) (width 0.1))
		)
		(layerContents (layerNumRef 28)
			(line (pt -3.97 1.852) (pt -2.87 2.952) (width 0.1))
		)
		(layerContents (layerNumRef 18)
			(line (pt 3.97 2.952) (pt -4.6 2.952) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt -3.97 -2.952) (pt 3.97 -2.952) (width 0.2))
		)
	)
	(symbolDef "B530C-13-F" (originalName "B530C-13-F")

		(pin (pinNum 1) (pt 100 mils 0 mils) (rotation 0) (pinLength 100 mils) (pinDisplay (dispPinName false)) (pinName (text (pt 240 mils -15 mils) (rotation 0]) (justify "Left") (textStyleRef "Default"))
		))
		(pin (pinNum 2) (pt 700 mils 0 mils) (rotation 180) (pinLength 100 mils) (pinDisplay (dispPinName false)) (pinName (text (pt 560 mils -15 mils) (rotation 0]) (justify "Right") (textStyleRef "Default"))
		))
		(line (pt 300 mils 100 mils) (pt 300 mils -100 mils) (width 6 mils))
		(line (pt 300 mils 100 mils) (pt 340 mils 100 mils) (width 6 mils))
		(line (pt 340 mils 100 mils) (pt 340 mils 60 mils) (width 6 mils))
		(line (pt 300 mils -100 mils) (pt 260 mils -100 mils) (width 6 mils))
		(line (pt 260 mils -100 mils) (pt 260 mils -60 mils) (width 6 mils))
		(line (pt 200 mils 0 mils) (pt 300 mils 0 mils) (width 6 mils))
		(line (pt 500 mils 0 mils) (pt 600 mils 0 mils) (width 6 mils))
		(poly (pt 300 mils 0 mils) (pt 500 mils 100 mils) (pt 500 mils -100 mils) (pt 300 mils 0 mils) (width 10  mils))
		(attr "RefDes" "RefDes" (pt 500 mils 350 mils) (justify Left) (isVisible True) (textStyleRef "Default"))

	)
	(compDef "B530C-13-F" (originalName "B530C-13-F") (compHeader (numPins 2) (numParts 1) (refDesPrefix D)
		)
		(compPin "1" (pinName "K") (partNum 1) (symPinNum 1) (gateEq 0) (pinEq 0) (pinType Bidirectional))
		(compPin "2" (pinName "A") (partNum 1) (symPinNum 2) (gateEq 0) (pinEq 0) (pinType Bidirectional))
		(attachedSymbol (partNum 1) (altType Normal) (symbolName "B530C-13-F"))
		(attachedPattern (patternNum 1) (patternName "DIOM7959X250N")
			(numPads 2)
			(padPinMap
				(padNum 1) (compPinRef "1")
				(padNum 2) (compPinRef "2")
			)
		)
		(attr "Mouser Part Number" "621-B530C-13-F")
		(attr "Mouser Price/Stock" "https://www.mouser.co.uk/ProductDetail/Diodes-Incorporated/B530C-13-F?qs=iysljaAVWRGB%252BaiZVguiyg%3D%3D")
		(attr "Manufacturer_Name" "Diodes Inc.")
		(attr "Manufacturer_Part_Number" "B530C-13-F")
		(attr "Description" "Diodes Inc B530C-13-F, SMT Schottky Diode, 30V 5A, 2-Pin DO-214AB")
		(attr "Datasheet Link" "https://www.diodes.com/assets/Datasheets/ds13012.pdf")
		(attr "Height" "2.5 mm")
	)

)