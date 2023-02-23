SamacSys ECAD Model
1696289/729305/2.49/2/3/Capacitor Polarised

DESIGNSPARK_INTERMEDIATE_ASCII

(asciiHeader
	(fileUnits MM)
)
(library Library_1
	(padStyleDef "r400_215"
		(holeDiam 0)
		(padShape (layerNumRef 1) (padShapeType Rect)  (shapeWidth 2.15) (shapeHeight 4))
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
	(patternDef "CAPAE1030X1050N" (originalName "CAPAE1030X1050N")
		(multiLayer
			(pad (padNum 1) (padStyleRef r400_215) (pt -4.25, 0) (rotation 90))
			(pad (padNum 2) (padStyleRef r400_215) (pt 4.25, 0) (rotation 90))
		)
		(layerContents (layerNumRef 18)
			(attr "RefDes" "RefDes" (pt 0, 0) (textStyleRef "Default") (isVisible True))
		)
		(layerContents (layerNumRef 30)
			(line (pt -6.75 5.75) (pt 6.75 5.75) (width 0.05))
		)
		(layerContents (layerNumRef 30)
			(line (pt 6.75 5.75) (pt 6.75 -5.75) (width 0.05))
		)
		(layerContents (layerNumRef 30)
			(line (pt 6.75 -5.75) (pt -6.75 -5.75) (width 0.05))
		)
		(layerContents (layerNumRef 30)
			(line (pt -6.75 -5.75) (pt -6.75 5.75) (width 0.05))
		)
		(layerContents (layerNumRef 28)
			(line (pt 5.15 5.15) (pt -2.575 5.15) (width 0.1))
		)
		(layerContents (layerNumRef 28)
			(line (pt -2.575 5.15) (pt -5.15 2.575) (width 0.1))
		)
		(layerContents (layerNumRef 28)
			(line (pt -5.15 2.575) (pt -5.15 -2.575) (width 0.1))
		)
		(layerContents (layerNumRef 28)
			(line (pt -5.15 -2.575) (pt -2.575 -5.15) (width 0.1))
		)
		(layerContents (layerNumRef 28)
			(line (pt -2.575 -5.15) (pt 5.15 -5.15) (width 0.1))
		)
		(layerContents (layerNumRef 28)
			(line (pt 5.15 -5.15) (pt 5.15 5.15) (width 0.1))
		)
		(layerContents (layerNumRef 18)
			(line (pt -6.25 5.15) (pt 5.15 5.15) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt -2.575 -5.15) (pt 5.15 -5.15) (width 0.2))
		)
	)
	(symbolDef "16TRV470M10X10_5" (originalName "16TRV470M10X10_5")

		(pin (pinNum 1) (pt 0 mils 0 mils) (rotation 0) (pinLength 100 mils) (pinDisplay (dispPinName false)) (pinName (text (pt 0 mils -35 mils) (rotation 0]) (justify "UpperLeft") (textStyleRef "Default"))
		))
		(pin (pinNum 2) (pt 500 mils 0 mils) (rotation 180) (pinLength 100 mils) (pinDisplay (dispPinName false)) (pinName (text (pt 500 mils -35 mils) (rotation 0]) (justify "UpperRight") (textStyleRef "Default"))
		))
		(line (pt 200 mils 100 mils) (pt 200 mils -100 mils) (width 6 mils))
		(line (pt 200 mils -100 mils) (pt 230 mils -100 mils) (width 6 mils))
		(line (pt 230 mils -100 mils) (pt 230 mils 100 mils) (width 6 mils))
		(line (pt 230 mils 100 mils) (pt 200 mils 100 mils) (width 6 mils))
		(line (pt 180 mils 50 mils) (pt 140 mils 50 mils) (width 6 mils))
		(line (pt 160 mils 70 mils) (pt 160 mils 30 mils) (width 6 mils))
		(line (pt 100 mils 0 mils) (pt 200 mils 0 mils) (width 6 mils))
		(line (pt 300 mils 0 mils) (pt 400 mils 0 mils) (width 6 mils))
		(poly (pt 300 mils 100 mils) (pt 300 mils -100 mils) (pt 270 mils -100 mils) (pt 270 mils 100 mils) (pt 300 mils 100 mils) (width 10  mils))
		(attr "RefDes" "RefDes" (pt 350 mils 250 mils) (justify 24) (isVisible True) (textStyleRef "Default"))

	)
	(compDef "16TRV470M10X10.5" (originalName "16TRV470M10X10.5") (compHeader (numPins 2) (numParts 1) (refDesPrefix C)
		)
		(compPin "1" (pinName "+") (partNum 1) (symPinNum 1) (gateEq 0) (pinEq 0) (pinType Bidirectional))
		(compPin "2" (pinName "-") (partNum 1) (symPinNum 2) (gateEq 0) (pinEq 0) (pinType Bidirectional))
		(attachedSymbol (partNum 1) (altType Normal) (symbolName "16TRV470M10X10_5"))
		(attachedPattern (patternNum 1) (patternName "CAPAE1030X1050N")
			(numPads 2)
			(padPinMap
				(padNum 1) (compPinRef "1")
				(padNum 2) (compPinRef "2")
			)
		)
		(attr "Mouser Part Number" "232-16TRV470M10X10.5")
		(attr "Mouser Price/Stock" "https://www.mouser.co.uk/ProductDetail/Rubycon/16TRV470M10X105?qs=T3oQrply3y940smn1RbN5g%3D%3D")
		(attr "Manufacturer_Name" "Rubycon")
		(attr "Manufacturer_Part_Number" "16TRV470M10X10.5")
		(attr "Description" "Aluminum Electrolytic Capacitors - SMD LONG LIFE ELECTROLYTIC CAPACITORS")
		(attr "Datasheet Link" "http://www.rubycon.co.jp/en/catalog/e_pdfs/aluminum/e_TRV.pdf")
		(attr "Height" "10.5 mm")
	)

)
