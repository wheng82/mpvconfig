--[[
*****************************************************************
** Context menu engine for mpv.                                **
** Origin_ Avi Halachmi https://github.com/avih                **
** Extension_ Thomas Carmichael https://gitlab.com/carmanaught **
*****************************************************************
mpv的tcl图形菜单的附属脚本 (2)/(3)
--]]

local function iso639_1(isoVal)
    local iso639_1_vals = {
        AA = "Afar",
        AB = "Abkhazian",
        AF = "Afrikaans",
        AK = "Akan",
        SQ = "Albanian",
        AM = "Amharic",
        AR = "Arabic",
        AN = "Aragonese",
        HY = "Armenian",
        AS = "Assamese",
        AV = "Avaric",
        AE = "Avestan",
        AY = "Aymara",
        AZ = "Azerbaijani",
        BA = "Bashkir",
        BM = "Bambara",
        EU = "Basque",
        BE = "Belarusian",
        BN = "Bengali",
        BH = "Bihari",
        BI = "Bislama",
        BS = "Bosnian",
        BR = "Breton",
        BG = "Bulgarian",
        MY = "Burmese",
        CA = "Catalan",
        CH = "Chamorro",
        CE = "Chechen",
        ZH = "Chinese",
        CU = "Church Slavic",
        CV = "Chuvash",
        KW = "Cornish",
        CO = "Corsican",
        CR = "Cree",
        CS = "Czech",
        DA = "Danish",
        DV = "Divehi",
        NL = "Dutch",
        DZ = "Dzongkha",
        EN = "English",
        EO = "Esperanto",
        ET = "Estonian",
        EE = "Ewe",
        FO = "Faroese",
        FJ = "Fijian",
        FI = "Finnish",
        FR = "French",
        FY = "Western Frisian",
        FF = "Fulah",
        KA = "Georgian",
        DE = "German",
        GD = "Gaelic",
        GA = "Irish",
        GL = "Galician",
        GV = "Manx",
        EL = "Greek",
        GN = "Guarani",
        GU = "Gujarati",
        HT = "Haitian",
        HA = "Hausa",
        HE = "Hebrew",
        HZ = "Herero",
        HI = "Hindi",
        HO = "Hiri Motu",
        HR = "Croatian",
        HU = "Hungarian",
        IG = "Igbo",
        IS = "Icelandic",
        IO = "Ido",
        II = "Sichuan Yi",
        IU = "Inuktitut",
        IE = "Interlingue",
        IA = "Interlingua",
        ID = "Indonesian",
        IK = "Inupiaq",
        IT = "Italian",
        JV = "Javanese",
        JA = "Japanese",
        KL = "Kalaallisut",
        KN = "Kannada",
        KS = "Kashmiri",
        KR = "Kanuri",
        KK = "Kazakh",
        KM = "Central Khmer",
        KI = "Kikuyu",
        RW = "Kinyarwanda",
        KY = "Kirghiz",
        KV = "Komi",
        KG = "Kongo",
        KO = "Korean",
        KJ = "Kuanyama",
        KU = "Kurdish",
        LO = "Lao",
        LA = "Latin",
        LV = "Latvian",
        LI = "Limburgan",
        LN = "Lingala",
        LT = "Lithuanian",
        LB = "Luxembourgish",
        LU = "Luba-Katanga",
        LG = "Ganda",
        MK = "Macedonian",
        MH = "Marshallese",
        ML = "Malayalam",
        MI = "Maori",
        MR = "Marathi",
        MS = "Malay",
        MG = "Malagasy",
        MT = "Maltese",
        MN = "Mongolian",
        NA = "Nauru",
        NV = "Navajo",
        NR = "South Ndebele",
        ND = "North Ndebele",
        NG = "Ndonga",
        NE = "Nepali",
        NN = "Norwegian Nynorsk",
        NB = "Norwegian Bokm책l",
        NO = "Norwegian",
        NY = "Chichewa",
        OC = "Occitan",
        OJ = "Ojibwa",
        OR = "Oriya",
        OM = "Oromo",
        OS = "Ossetian",
        PA = "Panjabi",
        FA = "Persian",
        PI = "Pali",
        PL = "Polish",
        PT = "Portuguese",
        PS = "Pushto",
        QU = "Quechua",
        RM = "Romansh",
        RO = "Romanian",
        RN = "Rundi",
        RU = "Russian",
        SG = "Sango",
        SA = "Sanskrit",
        SI = "Sinhala",
        SK = "Slovak",
        SL = "Slovenian",
        SE = "Northern Sami",
        SM = "Samoan",
        SN = "Shona",
        SD = "Sindhi",
        SO = "Somali",
        ST = "Southern Sotho",
        ES = "Spanish",
        SC = "Sardinian",
        SR = "Serbian",
        SS = "Swati",
        SU = "Sundanese",
        SW = "Swahili",
        SV = "Swedish",
        TY = "Tahitian",
        TA = "Tamil",
        TT = "Tatar",
        TE = "Telugu",
        TG = "Tajik",
        TL = "Tagalog",
        TH = "Thai",
        BO = "Tibetan",
        TI = "Tigrinya",
        TO = "Tonga",
        TN = "Tswana",
        TS = "Tsonga",
        TK = "Turkmen",
        TR = "Turkish",
        TW = "Twi",
        UG = "Uighur",
        UK = "Ukrainian",
        UR = "Urdu",
        UZ = "Uzbek",
        VE = "Venda",
        VI = "Vietnamese",
        VO = "Volap체k",
        CY = "Welsh",
        WA = "Walloon",
        WO = "Wolof",
        XH = "Xhosa",
        YI = "Yiddish",
        YO = "Yoruba",
        ZA = "Zhuang",
        ZU = "Zulu",
    }
    return iso639_1_vals[isoVal]
end

local function iso639_2(isoVal)
    local iso639_2_vals = {
        AAR = "Afar",
        ABK = "Abkhazian",
        AFR = "Afrikaans",
        AKA = "Akan",
        ALB = "Albanian",
        AMH = "Amharic",
        ARA = "Arabic",
        ARG = "Aragonese",
        ARM = "Armenian",
        ASM = "Assamese",
        AVA = "Avaric",
        AVE = "Avestan",
        AYM = "Aymara",
        AZE = "Azerbaijani",
        BAK = "Bashkir",
        BAM = "Bambara",
        BAQ = "Basque",
        BEL = "Belarusian",
        BEN = "Bengali",
        BIH = "Bihari",
        BIS = "Bislama",
        BOS = "Bosnian",
        BRE = "Breton",
        BUL = "Bulgarian",
        BUR = "Burmese",
        CAT = "Catalan",
        CHA = "Chamorro",
        CHE = "Chechen",
        CHI = "Chinese",
        CHU = "Church Slavic",
        CHV = "Chuvash",
        COR = "Cornish",
        COS = "Corsican",
        CRE = "Cree",
        CZE = "Czech",
        DAN = "Danish",
        DIV = "Divehi",
        DUT = "Dutch",
        DZO = "Dzongkha",
        ENG = "English",
        EPO = "Esperanto",
        EST = "Estonian",
        EWE = "Ewe",
        FAO = "Faroese",
        FIJ = "Fijian",
        FIN = "Finnish",
        FRE = "French",
        FRY = "Western Frisian",
        FUL = "Fulah",
        GEO = "Georgian",
        GER = "German",
        GLA = "Gaelic",
        GLE = "Irish",
        GLG = "Galician",
        GLV = "Manx",
        GRE = "Greek",
        GRN = "Guarani",
        GUJ = "Gujarati",
        HAT = "Haitian",
        HAU = "Hausa",
        HEB = "Hebrew",
        HER = "Herero",
        HIN = "Hindi",
        HMO = "Hiri Motu",
        HRV = "Croatian",
        HUN = "Hungarian",
        IBO = "Igbo",
        ICE = "Icelandic",
        IDO = "Ido",
        III = "Sichuan Yi",
        IKU = "Inuktitut",
        ILE = "Interlingue",
        INA = "Interlingua",
        IND = "Indonesian",
        IPK = "Inupiaq",
        ITA = "Italian",
        JAV = "Javanese",
        JPN = "Japanese",
        KAL = "Kalaallisut",
        KAN = "Kannada",
        KAS = "Kashmiri",
        KAU = "Kanuri",
        KAZ = "Kazakh",
        KHM = "Central Khmer",
        KIK = "Kikuyu",
        KIN = "Kinyarwanda",
        KIR = "Kirghiz",
        KOM = "Komi",
        KON = "Kongo",
        KOR = "Korean",
        KUA = "Kuanyama",
        KUR = "Kurdish",
        LAO = "Lao",
        LAT = "Latin",
        LAV = "Latvian",
        LIM = "Limburgan",
        LIN = "Lingala",
        LIT = "Lithuanian",
        LTZ = "Luxembourgish",
        LUB = "Luba-Katanga",
        LUG = "Ganda",
        MAC = "Macedonian",
        MAH = "Marshallese",
        MAL = "Malayalam",
        MAO = "Maori",
        MAR = "Marathi",
        MAY = "Malay",
        MLG = "Malagasy",
        MLT = "Maltese",
        MON = "Mongolian",
        NAU = "Nauru",
        NAV = "Navajo",
        NBL = "South Ndebele",
        NDE = "North Ndebele",
        NDO = "Ndonga",
        NEP = "Nepali",
        NNO = "Norwegian Nynorsk",
        NOB = "Norwegian Bokm책l",
        NOR = "Norwegian",
        NYA = "Chichewa",
        OCI = "Occitan",
        OJI = "Ojibwa",
        ORI = "Oriya",
        ORM = "Oromo",
        OSS = "Ossetian",
        PAN = "Panjabi",
        PER = "Persian",
        PLI = "Pali",
        POL = "Polish",
        POR = "Portuguese",
        PUS = "Pushto",
        QUE = "Quechua",
        ROH = "Romansh",
        RUM = "Romanian",
        RUN = "Rundi",
        RUS = "Russian",
        SAG = "Sango",
        SAN = "Sanskrit",
        SIN = "Sinhala",
        SLO = "Slovak",
        SLV = "Slovenian",
        SME = "Northern Sami",
        SMO = "Samoan",
        SNA = "Shona",
        SND = "Sindhi",
        SOM = "Somali",
        SOT = "Southern Sotho",
        SPA = "Spanish",
        SRD = "Sardinian",
        SRP = "Serbian",
        SSW = "Swati",
        SUN = "Sundanese",
        SWA = "Swahili",
        SWE = "Swedish",
        TAH = "Tahitian",
        TAM = "Tamil",
        TAT = "Tatar",
        TEL = "Telugu",
        TGK = "Tajik",
        TGL = "Tagalog",
        THA = "Thai",
        TIB = "Tibetan",
        TIR = "Tigrinya",
        TON = "Tonga",
        TSN = "Tswana",
        TSO = "Tsonga",
        TUK = "Turkmen",
        TUR = "Turkish",
        TWI = "Twi",
        UIG = "Uighur",
        UKR = "Ukrainian",
        URD = "Urdu",
        UZB = "Uzbek",
        VEN = "Venda",
        VIE = "Vietnamese",
        VOL = "Volap체k",
        WEL = "Welsh",
        WLN = "Walloon",
        WOL = "Wolof",
        XHO = "Xhosa",
        YID = "Yiddish",
        YOR = "Yoruba",
        ZHA = "Zhuang",
        ZUL = "Zulu",
    }
    return iso639_2_vals[isoVal]
end

local langcodes = {
    iso639_1 = iso639_1,
    iso639_2 = iso639_2,
}

return langcodes
