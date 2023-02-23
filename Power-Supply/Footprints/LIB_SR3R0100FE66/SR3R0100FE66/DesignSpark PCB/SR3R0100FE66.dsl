SamacSys ECAD Model
1858294/729305/2.49/2/4/Resistor

DESIGNSPARK_INTERMEDIATE_ASCII

(asciiHeader
	(fileUnits MM)
)
(library Library_1
	(padStyleDef "s190.6_h127.1"
		(holeDiam 1.271)
		(padShape (layerNumRef 1) (padShapeType Rect)  (shapeWidth 1.906) (shapeHeight 1.906))
		(padShape (layerNumRef 16) (padShapeType Rect)  (shapeWidth 1.906) (shapeHeight 1.906))
	)
	(padStyleDef "c190.6_h127.1"
		(holeDiam 1.271)
		(padShape (layerNumRef 1) (padShapeType Ellipse)  (shapeWidth 1.906) (shapeHeight 1.906))
		(padShape (layerNumRef 16) (padShapeType Ellipse)  (shapeWidth 1.906) (shapeHeight 1.906))
	)
	(textStyleDef "Default"
		(font
			(fontType Stroke)
			(fontFace "Helvetica")
			(fontHeight 50 mils)
			(strokeWidth 5 mils)
		)
	)
	(patternDef "SR3R0100FE66" (originalName "SR3R0100FE66")
		(multiLayer
			(pad (padNum 1) (padStyleRef s190.6_h127.1) (pt 0.000, 0.000) (rotation 90))
			(pad (padNum 2) (padStyleRef c190.6_h127.1) (pt 15.240, 0.000) (rotation 90))
		)
		(layerContents (layerNumRef 18)
			(attr "RefDes" "RefDes" (pt 7.620, 0.000) (textStyleRef "Default") (isVisible True))
		)
		(layerContents (layerNumRef 28)
			(line (pt -0.825 0.82) (pt 16.065 0.82) (width 0.2))
		)
		(layerContents (layerNumRef 28)
			(line (pt 16.065 0.82) (pt 16.065 -0.82) (width 0.2))
		)
		(layerContents (layerNumRef 28)
			(line (pt 16.065 -0.82) (pt -0.825 -0.82) (width 0.2))
		)
		(layerContents (layerNumRef 28)
			(line (pt -0.825 -0.82) (pt -0.825 0.82) (width 0.2))
		)
		(layerContents (layerNumRef 30)
			(line (pt -1.953 1.953) (pt 17.193 1.953) (width 0.1))
		)
		(layerContents (layerNumRef 30)
			(line (pt 17.193 1.953) (pt 17.193 -1.953) (width 0.1))
		)
		(layerContents (layerNumRef 30)
			(line (pt 17.193 -1.953) (pt -1.953 -1.953) (width 0.1))
		)
		(layerContents (layerNumRef 30)
			(line (pt -1.953 -1.953) (pt -1.953 1.953) (width 0.1))
		)
		(layerContents (layerNumRef 18)
			(line (pt 1.32 0.82) (pt 14.22 0.82) (width 0.1))
		)
		(layerContents (layerNumRef 18)
			(line (pt 1.32 -0.82) (pt 14.22 -0.82) (width 0.1))
		)
	)
	(symbolDef "SR3R0100FE66" (originalName "SR3R0100FE66")

		(pin (pinNum 1) (pt 0 mils 0 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName false)) (pinName (text (pt 0 mils -35 mils) (rotation 0]) (justify "UpperLeft") (textStyleRef "Default"))
		))
		(pin (pinNum 2) (pt 700 mils 0 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName false)) (pinName (text (pt 700 mils -35 mils) (rotation 0]) (justify "UpperRight") (textStyleRef "Default"))
		))
		(line (pt 200 mils 50 mils) (pt 500 mils 50 mils) (width 6 mils))
		(line (pt 500 mils 50 mils) (pt 500 mils -50 mils) (width 6 mils))
		(line (pt 500 mils -50 mils) (pt 200 mils -50 mils) (width 6 mils))
		(line (pt 200 mils -50 mils) (pt 200 mils 50 mils) (width 6 mils))
		(attr "RefDes" "RefDes" (pt 550 mils 250 mils) (justify Left) (isVisible True) (textStyleRef "Default"))

	)
	(compDef "SR3R0100FE66" (originalName "SR3R0100FE66") (compHeader (numPins 2) (numParts 1) (refDesPrefix R)
		)
		(compPin "1" (pinName "1") (partNum 1) (symPinNum 1) (gateEq 0) (pinEq 0) (pinType Bidirectional))
		(compPin "2" (pinName "2") (partNum 1) (symPinNum 2) (gateEq 0) (pinEq 0) (pinType Bidirectional))
		(attachedSymbol (partNum 1) (altType Normal) (symbolName "SR3R0100FE66"))
		(attachedPattern (patternNum 1) (patternName "SR3R0100FE66")
			(numPads 2)
			(padPinMap
				(padNum 1) (compPinRef "1")
				(padNum 2) (compPinRef "2")
			)
		)
		(attr "Mouser Part Number" "71-SR3R0100FE66")
		(attr "Mouser Price/Stock" "https://www.mouser.co.uk/ProductDetail/Vishay-Dale/SR3R0100FE66?qs=BZBei1rCqCAq0LKoiENeyg%3D%3D")
		(attr "Manufacturer_Name" "Vishay")
		(attr "Manufacturer_Part_Number" "SR3R0100FE66")
		(attr "Description" "Vishay .01   OHM  1% 3W")
		(attr "Datasheet Link" "https://www.arrow.com/en/products/sr3r0100fe66/vishay")
		(attr "Height" "25.4 mm")
	)

)
