object dmMain: TdmMain
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 176
  Width = 471
  object MonopoliaTest: TADOConnection
    DefaultDatabase = 'MonopoliaTest'
    IsolationLevel = ilReadCommitted
    KeepConnection = False
    LoginPrompt = False
    Mode = cmReadWrite
    Provider = 'SQLOLEDB.1'
    Left = 41
    Top = 6
  end
  object dsDocs: TDataSource
    AutoEdit = False
    DataSet = aqrDocs
    Left = 40
    Top = 104
  end
  object dsDocsContent: TDataSource
    AutoEdit = False
    DataSet = aqrDocsContent
    Left = 104
    Top = 104
  end
  object dsGoods: TDataSource
    AutoEdit = False
    DataSet = aqrGoods
    Left = 176
    Top = 104
  end
  object dsClients: TDataSource
    AutoEdit = False
    DataSet = aqrClients
    Left = 232
    Top = 104
  end
  object aqrGoods: TADOQuery
    Connection = MonopoliaTest
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select '
      '* '
      'from '
      'dbo.GOODS')
    Left = 176
    Top = 56
    object aqrGoodsID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object aqrGoodsNAME: TStringField
      FieldName = 'NAME'
      Size = 100
    end
  end
  object aqrClients: TADOQuery
    Connection = MonopoliaTest
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select '
      '* '
      'from '
      'dbo.CLIENTS')
    Left = 232
    Top = 56
    object aqrClientsID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object aqrClientsNAME: TStringField
      FieldName = 'NAME'
      Size = 100
    end
  end
  object aqrDocsContent: TADOQuery
    Connection = MonopoliaTest
    CursorType = ctStatic
    DataSource = dsDocs
    Parameters = <
      item
        Name = 'id'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 1
      end>
    SQL.Strings = (
      'select'
      'dbo.DOCS_CONTENT.ID,'
      'dbo.DOCS_CONTENT.GOOD,'
      'dbo.GOODS.NAME,'
      'dbo.DOCS_CONTENT.CNT,'
      'dbo.DOCS_CONTENT.PRICE,'
      'dbo.DOCS_CONTENT.SUMM'
      'from'
      'dbo.DOCS_CONTENT'
      'join dbo.GOODS on (dbo.DOCS_CONTENT.GOOD = dbo.GOODS.ID)'
      'where dbo.DOCS_CONTENT.DOC = :ID'
      'order by dbo.DOCS_CONTENT.ID')
    Left = 104
    Top = 56
    object aqrDocsContentID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object aqrDocsContentGOOD: TIntegerField
      FieldName = 'GOOD'
    end
    object aqrDocsContentNAME: TStringField
      FieldName = 'NAME'
      Size = 100
    end
    object aqrDocsContentCNT: TIntegerField
      FieldName = 'CNT'
    end
    object aqrDocsContentPRICE: TBCDField
      FieldName = 'PRICE'
      DisplayFormat = '#,##0.00'
      Precision = 8
      Size = 2
    end
    object aqrDocsContentSUMM: TBCDField
      FieldName = 'SUMM'
      DisplayFormat = '#,##0.00'
      Precision = 8
      Size = 2
    end
  end
  object aqrDocs: TADOQuery
    Connection = MonopoliaTest
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select'
      'dbo.DOCS.ID,'
      'dbo.DOCS.DATE_DOCS,'
      'dbo.DOCS.CLIENT,'
      'dbo.CLIENTS.NAME,'
      'dbo.DOCS.SUMM,'
      'dbo.DOCS.POST'
      'from'
      'dbo.DOCS'
      'join dbo.CLIENTS on (dbo.DOCS.CLIENT = dbo.CLIENTS.ID)'
      'order by dbo.DOCS.ID')
    Left = 40
    Top = 56
    object aqrDocsID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object aqrDocsDATE_DOCS: TDateTimeField
      FieldName = 'DATE_DOCS'
    end
    object aqrDocsCLIENT: TIntegerField
      FieldName = 'CLIENT'
    end
    object aqrDocsNAME: TStringField
      FieldName = 'NAME'
      Size = 100
    end
    object aqrDocsSUMM: TBCDField
      FieldName = 'SUMM'
      DisplayFormat = '#,##0.00'
      Precision = 8
      Size = 2
    end
    object aqrDocsPOST: TStringField
      FieldName = 'POST'
      FixedChar = True
      Size = 1
    end
  end
  object comMain: TADOCommand
    Connection = MonopoliaTest
    Parameters = <>
    Left = 104
    Top = 8
  end
  object dsClientsSelect: TDataSource
    AutoEdit = False
    DataSet = aqrClientsSelect
    Left = 392
    Top = 104
  end
  object aqrClientsSelect: TADOQuery
    Connection = MonopoliaTest
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select '
      '* '
      'from '
      'dbo.CLIENTS')
    Left = 392
    Top = 56
    object aqrClientsSelectID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object aqrClientsSelectNAME: TStringField
      FieldName = 'NAME'
      Size = 100
    end
  end
  object dsGoodsSelect: TDataSource
    AutoEdit = False
    DataSet = aqrGoodsSelect
    Left = 304
    Top = 104
  end
  object aqrGoodsSelect: TADOQuery
    Connection = MonopoliaTest
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select '
      '* '
      'from '
      'dbo.GOODS')
    Left = 304
    Top = 56
    object aqrGoodsSelectID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object aqrGoodsSelectNAME: TStringField
      FieldName = 'NAME'
      Size = 100
    end
  end
end
