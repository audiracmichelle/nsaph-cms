from nsaph_utils.utils.context import Context, Argument, Cardinality


class CMSSchema(Context):
    """
    Configuration object to configure parsing
    File Transfer Summary files and creating
    YAML data model
    """

    _output = Argument("output",
            help = "Output path for schema",
            type = str,
            default = None,
            cardinality = Cardinality.single
        )

    _input = Argument("input",
            help = "Path to directory containing FTS files."
                   + "Files are looked for by using "
                   + " '**/maxdata_(ps|ip)_*.fts' pattern",
            type = str,
            default = None,
            cardinality = Cardinality.single
        )

    def __init__(self, doc):
        self.output = None
        ''' Output path for schema '''
        self.input = None
        ''' Path to directory containing FTS files '''
        super().__init__(CMSSchema, doc, include_default = False)
