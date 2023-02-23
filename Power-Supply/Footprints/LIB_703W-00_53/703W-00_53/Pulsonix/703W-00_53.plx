PULSONIX_LIBRARY_ASCII "SamacSys ECAD Model"
//649690/729305/2.49/5/4/Connector

(asciiHeader
	(fileUnits MM)
)
(library Library_1
	(padStyleDef "c270_h180"
		(holeDiam 1.8)
		(padShape (layerNumRef 1) (padShapeType Ellipse)  (shapeWidth 2.700) (shapeHeight 2.700))
		(padShape (layerNumRef 16) (padShapeType Ellipse)  (shapeWidth 2.700) (shapeHeight 2.700))
	)
	(padStyleDef "c525_h350"
		(holeDiam 3.5)
		(padShape (layerNumRef 1) (padShapeType Ellipse)  (shapeWidth 5.250) (shapeHeight 5.250))
		(padShape (layerNumRef 16) (padShapeType Ellipse)  (shapeWidth 5.250) (shapeHeight 5.250))
	)
	(textStyleDef "Normal"
		(font
			(fontType Stroke)
			(fontFace "Helvetica")
			(fontHeight 1.27)
			(strokeWidth 0.127)
		)
	)
	(patternDef "703W0053" (originalName "703W0053")
		(multiLayer
			(pad (padNum 1) (padStyleRef c270_h180) (pt 0.000, -0.000) (rotation 90))
			(pad (padNum 2) (padStyleRef c270_h180) (pt -7.000, -0.000) (rotation 90))
			(pad (padNum 3) (padStyleRef c270_h180) (pt -14.000, -0.000) (rotation 90))
			(pad (padNum 4) (padStyleRef c525_h350) (pt 12.750, 7.300) (rotation 90))
			(pad (padNum 5) (padStyleRef c525_h350) (pt -26.750, 7.300) (rotation 90))
		)
		(layerContents (layerNumRef 18)
			(attr "RefDes" "RefDes" (pt -7.000, 8.825) (textStyleRef "Normal") (isVisible True))
		)
		(layerContents (layerNumRef 28)
			(line (pt -32 -0) (pt 18 -0) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt 18 -0) (pt 18 16) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt 18 16) (pt -32 16) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt -32 16) (pt -32 -0) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt -21.9 19) (pt 7.9 19) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt 7.9 19) (pt 7.9 16) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt 7.9 16) (pt -21.9 16) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt -21.9 16) (pt -21.9 19) (width 0.025))
		)
		(layerContents (layerNumRef 18)
			(line (pt -16 0) (pt -32 0) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt -32 0) (pt -32 -0) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt -32 -0) (pt -16 -0) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt -16 -0) (pt -16 0) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt -32 -0) (pt -32 -0) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt -32 -0) (pt -32 16) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt -32 16) (pt -32 16) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt -32 16) (pt -32 -0) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt -32 16) (pt 18 16) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt 18 16) (pt 18 16) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt 18 16) (pt -32 16) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt -32 16) (pt -32 16) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt 18 16) (pt 18 16) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt 18 16) (pt 18 -0) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt 18 -0) (pt 18 -0) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt 18 -0) (pt 18 16) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt 18 -0) (pt 2 -0) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt 2 -0) (pt 2 -0) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt 2 -0) (pt 18 -0) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt 18 -0) (pt 18 -0) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt -2 -0) (pt -5 -0) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt -5 -0) (pt -5 -0) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt -5 -0) (pt -2 -0) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt -2 -0) (pt -2 -0) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt -9 -0) (pt -12 -0) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt -12 -0) (pt -12 -0) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt -12 -0) (pt -9 -0) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt -9 -0) (pt -9 -0) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt -21.9 16) (pt 7.9 16) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt 7.9 16) (pt 7.9 19) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt 7.9 19) (pt -21.9 19) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt -21.9 19) (pt -21.9 16) (width 0.2))
		)
		(layerContents (layerNumRef Courtyard_Top)
			(line (pt -33 20) (pt 19 20) (width 0.1))
		)
		(layerContents (layerNumRef Courtyard_Top)
			(line (pt 19 20) (pt 19 -2.35) (width 0.1))
		)
		(layerContents (layerNumRef Courtyard_Top)
			(line (pt 19 -2.35) (pt -33 -2.35) (width 0.1))
		)
		(layerContents (layerNumRef Courtyard_Top)
			(line (pt -33 -2.35) (pt -33 20) (width 0.1))
		)
		(layerContents (layerNumRef 18)
			(line (pt 0 -2) (pt 0 -2) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(arc (pt 0, -1.95) (radius 0.05) (startAngle 270) (sweepAngle 180.0) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt 0 -1.9) (pt 0 -1.9) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(arc (pt 0, -1.95) (radius 0.05) (startAngle 90.0) (sweepAngle 180.0) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt 0 -2) (pt 0 -2) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(arc (pt 0, -1.95) (radius 0.05) (startAngle 270) (sweepAngle 180.0) (width 0.2))
		)
	)
	(symbolDef "703W-00_53" (originalName "703W-00_53")

		(pin (pinNum 1) (pt 0 mils -200 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -225 mils) (rotation 0]) (justify "Left") (textStyleRef "Normal"))
		))
		(pin (pinNum 2) (pt 0 mils -100 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -125 mils) (rotation 0]) (justify "Left") (textStyleRef "Normal"))
		))
		(pin (pinNum 3) (pt 0 mils 0 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -25 mils) (rotation 0]) (justify "Left") (textStyleRef "Normal"))
		))
		(pin (pinNum 4) (pt 900 mils -100 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 670 mils -125 mils) (rotation 0]) (justify "Right") (textStyleRef "Normal"))
		))
		(pin (pinNum 5) (pt 900 mils 0 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 670 mils -25 mils) (rotation 0]) (justify "Right") (textStyleRef "Normal"))
		))
		(line (pt 200 mils 100 mils) (pt 700 mils 100 mils) (width 6 mils))
		(line (pt 700 mils 100 mils) (pt 700 mils -300 mils) (width 6 mils))
		(line (pt 700 mils -300 mils) (pt 200 mils -300 mils) (width 6 mils))
		(line (pt 200 mils -300 mils) (pt 200 mils 100 mils) (width 6 mils))
		(attr "RefDes" "RefDes" (pt 750 mils 300 mils) (justify Left) (isVisible True) (textStyleRef "Normal"))
		(attr "Type" "Type" (pt 750 mils 200 mils) (justify Left) (isVisible True) (textStyleRef "Normal"))

	)
	(compDef "703W-00_53" (originalName "703W-00_53") (compHeader (numPins 5) (numParts 1) (refDesPrefix J)
		)
		(compPin "1" (pinName "L") (partNum 1) (symPinNum 1) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "2" (pinName "E") (partNum 1) (symPinNum 2) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "3" (pinName "N") (partNum 1) (symPinNum 3) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "MH1" (pinName "MH1") (partNum 1) (symPinNum 4) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "MH2" (pinName "MH2") (partNum 1) (symPinNum 5) (gateEq 0) (pinEq 0) (pinType Unknown))
		(attachedSymbol (partNum 1) (altType Normal) (symbolName "703W-00_53"))
		(attachedPattern (patternNum 1) (patternName "703W0053")
			(numPads 5)
			(padPinMap
				(padNum 1) (compPinRef "1")
				(padNum 2) (compPinRef "2")
				(padNum 3) (compPinRef "3")
				(padNum 4) (compPinRef "MH1")
				(padNum 5) (compPinRef "MH2")
			)
		)
		(attr "Mouser Part Number" "562-703W-00/53")
		(attr "Mouser Price/Stock" "https://www.mouser.co.uk/ProductDetail/Qualtek/703W-00-53?qs=%252BCmxX1pwNuHERMfCpPr41g%3D%3D")
		(attr "Manufacturer_Name" "Qualtek")
		(attr "Manufacturer_Part_Number" "703W-00/53")
		(attr "Description" "AC Power Entry Modules PCB Mount 7mm")
		(attr "<Hyperlink>" "http://www.qualtekusa.com/Catalog/AC_Receptacles/pdfs/703w0053.pdf")
		(attr "<Component Height>" "28.7")
		(attr "<STEP Filename>" "703W-00_53.stp")
		(attr "<STEP Offsets>" "X=0;Y=0;Z=0")
		(attr "<STEP Rotation>" "X=0;Y=0;Z=0")
	)

)
