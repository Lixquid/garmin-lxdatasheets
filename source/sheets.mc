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
            [
                "T568",
                [
                    [
                        $.Rez.Strings.Electrical_T568,
                        [
                            {:x => 16, :cy=> 1, :i => $.Rez.Drawables.Electrical_T568_A},
                            {:x => 24, :cy=> 1, :i => $.Rez.Drawables.Electrical_T568_A},
                            {:x => 32, :cy=> 1, :i => $.Rez.Drawables.Electrical_T568_A},
                            {:x => 16, :cy=> 11, :i => $.Rez.Drawables.Electrical_T568_B},
                            {:x => 24, :cy=> 11, :i => $.Rez.Drawables.Electrical_T568_B},
                            {:x => 32, :cy=> 11, :i => $.Rez.Drawables.Electrical_T568_B},
                            {:xAlign => LX_ALIGN_CENTER, :cy=> 21, :i => $.Rez.Drawables.Electrical_T568_Pins},
                        ]
                    ]
                ]
            ]
        ],
    ],
    [
        "Physics", [
            ["Units", [[$.Rez.Strings.Physics_Units_1, []], [$.Rez.Strings.Physics_Units_2, []]]]
        ]
    ]
];
