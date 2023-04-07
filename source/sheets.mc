var lxSheets = [
    [
        "Chemistry",
        [
            ["Periodic Table", [[$.Rez.Strings.Chemistry_PeriodicTable, [
                {:xAlign => LX_ALIGN_CENTER, :i => $.Rez.Drawables.Chemistry_PeriodicTable_Table},
                {:cx => 1, :cy => 15, :i => $.Rez.Drawables.Chemistry_PeriodicTable_Legend}
            ]]]]
        ]
    ],
    [
        "Communication",
        [
            ["ASCII Table", [[$.Rez.Strings.Communication_ASCIITable, []]]],
            ["NATO Alphabet", [[$.Rez.Strings.Communication_NATOAlphabet, []]]],
        ],
    ],
    [
        "Electrical",
        [
            [
                "Resistor Code",
                [
                    [
                        $.Rez.Strings.Electrical_ResistorCode,
                        [
                            {
                                :x => 0,
                                :y => -1,
                                :cy => 20,
                                :i => $.Rez.Drawables.Electrical_ResistorCode_Colors,
                            },
                            {
                                :x => 0,
                                :y => 0,
                                :xAlign => LX_ALIGN_CENTER,
                                :i => $.Rez.Drawables.Electrical_ResistorCode_Diagram,
                            },
                        ],
                    ],
                ],
            ],
        ],
    ],
    [
        "Physics", [
            ["Units", [[$.Rez.Strings.Physics_Units_1, []], [$.Rez.Strings.Physics_Units_2, []]]]
        ]
    ]
];
