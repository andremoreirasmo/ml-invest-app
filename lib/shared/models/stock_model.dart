class StockModel {
  int? id;
  String? name;
  String? image;
  String? ticker;
  Summary? summary;
  Chart? chart;

  StockModel(
      {this.id, this.name, this.image, this.ticker, this.summary, this.chart});

  StockModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    image = json["image"];
    ticker = json["ticker"];
    summary =
        json["summary"] == null ? null : Summary.fromJson(json["summary"]);
    chart = json["chart"] == null ? null : Chart.fromJson(json["chart"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["image"] = image;
    _data["ticker"] = ticker;
    if (summary != null) {
      _data["summary"] = summary?.toJson();
    }
    if (chart != null) {
      _data["chart"] = chart?.toJson();
    }
    return _data;
  }
}

class Chart {
  Meta? meta;
  List<Quotes>? quotes;
  Events? events;

  Chart({this.meta, this.quotes, this.events});

  Chart.fromJson(Map<String, dynamic> json) {
    meta = json["meta"] == null ? null : Meta.fromJson(json["meta"]);
    quotes = json["quotes"] == null
        ? null
        : (json["quotes"] as List).map((e) => Quotes.fromJson(e)).toList();
    events = json["events"] == null ? null : Events.fromJson(json["events"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (meta != null) {
      _data["meta"] = meta?.toJson();
    }
    if (quotes != null) {
      _data["quotes"] = quotes?.map((e) => e.toJson()).toList();
    }
    if (events != null) {
      _data["events"] = events?.toJson();
    }
    return _data;
  }
}

class Events {
  List<Dividends>? dividends;

  Events({this.dividends});

  Events.fromJson(Map<String, dynamic> json) {
    dividends = json["dividends"] == null
        ? null
        : (json["dividends"] as List)
            .map((e) => Dividends.fromJson(e))
            .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (dividends != null) {
      _data["dividends"] = dividends?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Dividends {
  num? amount;
  String? date;

  Dividends({this.amount, this.date});

  Dividends.fromJson(Map<String, dynamic> json) {
    amount = json["amount"];
    date = json["date"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["amount"] = amount;
    _data["date"] = date;
    return _data;
  }
}

class Quotes {
  String? date;
  num? high;
  int? volume;
  int? open;
  num? low;
  num? close;
  num? adjclose;

  Quotes(
      {this.date,
      this.high,
      this.volume,
      this.open,
      this.low,
      this.close,
      this.adjclose});

  Quotes.fromJson(Map<String, dynamic> json) {
    date = json["date"];
    high = json["high"];
    volume = json["volume"];
    open = json["open"];
    low = json["low"];
    close = json["close"];
    adjclose = json["adjclose"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["date"] = date;
    _data["high"] = high;
    _data["volume"] = volume;
    _data["open"] = open;
    _data["low"] = low;
    _data["close"] = close;
    _data["adjclose"] = adjclose;
    return _data;
  }
}

class Meta {
  String? currency;
  String? symbol;
  String? exchangeName;
  String? instrumentType;
  String? firstTradeDate;
  String? regularMarketTime;
  int? gmtoffset;
  String? timezone;
  String? exchangeTimezoneName;
  num? regularMarketPrice;
  num? chartPreviousClose;
  int? priceHint;
  CurrentTradingPeriod? currentTradingPeriod;
  String? dataGranularity;
  String? range;
  List<String>? validRanges;

  Meta(
      {this.currency,
      this.symbol,
      this.exchangeName,
      this.instrumentType,
      this.firstTradeDate,
      this.regularMarketTime,
      this.gmtoffset,
      this.timezone,
      this.exchangeTimezoneName,
      this.regularMarketPrice,
      this.chartPreviousClose,
      this.priceHint,
      this.currentTradingPeriod,
      this.dataGranularity,
      this.range,
      this.validRanges});

  Meta.fromJson(Map<String, dynamic> json) {
    currency = json["currency"];
    symbol = json["symbol"];
    exchangeName = json["exchangeName"];
    instrumentType = json["instrumentType"];
    firstTradeDate = json["firstTradeDate"];
    regularMarketTime = json["regularMarketTime"];
    gmtoffset = json["gmtoffset"];
    timezone = json["timezone"];
    exchangeTimezoneName = json["exchangeTimezoneName"];
    regularMarketPrice = json["regularMarketPrice"];
    chartPreviousClose = json["chartPreviousClose"];
    priceHint = json["priceHint"];
    currentTradingPeriod = json["currentTradingPeriod"] == null
        ? null
        : CurrentTradingPeriod.fromJson(json["currentTradingPeriod"]);
    dataGranularity = json["dataGranularity"];
    range = json["range"];
    validRanges = json["validRanges"] == null
        ? null
        : List<String>.from(json["validRanges"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["currency"] = currency;
    _data["symbol"] = symbol;
    _data["exchangeName"] = exchangeName;
    _data["instrumentType"] = instrumentType;
    _data["firstTradeDate"] = firstTradeDate;
    _data["regularMarketTime"] = regularMarketTime;
    _data["gmtoffset"] = gmtoffset;
    _data["timezone"] = timezone;
    _data["exchangeTimezoneName"] = exchangeTimezoneName;
    _data["regularMarketPrice"] = regularMarketPrice;
    _data["chartPreviousClose"] = chartPreviousClose;
    _data["priceHint"] = priceHint;
    if (currentTradingPeriod != null) {
      _data["currentTradingPeriod"] = currentTradingPeriod?.toJson();
    }
    _data["dataGranularity"] = dataGranularity;
    _data["range"] = range;
    if (validRanges != null) {
      _data["validRanges"] = validRanges;
    }
    return _data;
  }
}

class CurrentTradingPeriod {
  Pre? pre;
  Regular? regular;
  Post? post;

  CurrentTradingPeriod({this.pre, this.regular, this.post});

  CurrentTradingPeriod.fromJson(Map<String, dynamic> json) {
    pre = json["pre"] == null ? null : Pre.fromJson(json["pre"]);
    regular =
        json["regular"] == null ? null : Regular.fromJson(json["regular"]);
    post = json["post"] == null ? null : Post.fromJson(json["post"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (pre != null) {
      _data["pre"] = pre?.toJson();
    }
    if (regular != null) {
      _data["regular"] = regular?.toJson();
    }
    if (post != null) {
      _data["post"] = post?.toJson();
    }
    return _data;
  }
}

class Post {
  String? timezone;
  String? end;
  String? start;
  int? gmtoffset;

  Post({this.timezone, this.end, this.start, this.gmtoffset});

  Post.fromJson(Map<String, dynamic> json) {
    timezone = json["timezone"];
    end = json["end"];
    start = json["start"];
    gmtoffset = json["gmtoffset"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["timezone"] = timezone;
    _data["end"] = end;
    _data["start"] = start;
    _data["gmtoffset"] = gmtoffset;
    return _data;
  }
}

class Regular {
  String? timezone;
  String? end;
  String? start;
  int? gmtoffset;

  Regular({this.timezone, this.end, this.start, this.gmtoffset});

  Regular.fromJson(Map<String, dynamic> json) {
    timezone = json["timezone"];
    end = json["end"];
    start = json["start"];
    gmtoffset = json["gmtoffset"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["timezone"] = timezone;
    _data["end"] = end;
    _data["start"] = start;
    _data["gmtoffset"] = gmtoffset;
    return _data;
  }
}

class Pre {
  String? timezone;
  String? end;
  String? start;
  int? gmtoffset;

  Pre({this.timezone, this.end, this.start, this.gmtoffset});

  Pre.fromJson(Map<String, dynamic> json) {
    timezone = json["timezone"];
    end = json["end"];
    start = json["start"];
    gmtoffset = json["gmtoffset"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["timezone"] = timezone;
    _data["end"] = end;
    _data["start"] = start;
    _data["gmtoffset"] = gmtoffset;
    return _data;
  }
}

class Summary {
  AssetProfile? assetProfile;
  SummaryDetail? summaryDetail;
  Price? price;
  FinancialData? financialData;

  Summary(
      {this.assetProfile, this.summaryDetail, this.price, this.financialData});

  Summary.fromJson(Map<String, dynamic> json) {
    assetProfile = json["assetProfile"] == null
        ? null
        : AssetProfile.fromJson(json["assetProfile"]);
    summaryDetail = json["summaryDetail"] == null
        ? null
        : SummaryDetail.fromJson(json["summaryDetail"]);
    price = json["price"] == null ? null : Price.fromJson(json["price"]);
    financialData = json["financialData"] == null
        ? null
        : FinancialData.fromJson(json["financialData"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (assetProfile != null) {
      _data["assetProfile"] = assetProfile?.toJson();
    }
    if (summaryDetail != null) {
      _data["summaryDetail"] = summaryDetail?.toJson();
    }
    if (price != null) {
      _data["price"] = price?.toJson();
    }
    if (financialData != null) {
      _data["financialData"] = financialData?.toJson();
    }
    return _data;
  }
}

class FinancialData {
  int? maxAge;
  num? currentPrice;
  int? targetHighPrice;
  num? targetLowPrice;
  num? targetMeanPrice;
  num? targetMedianPrice;
  num? recommendationMean;
  String? recommendationKey;
  int? numberOfAnalystOpinions;
  int? totalCash;
  num? totalCashPerShare;
  int? ebitda;
  int? totalDebt;
  num? quickRatio;
  num? currentRatio;
  int? totalRevenue;
  num? debtToEquity;
  num? revenuePerShare;
  num? returnOnAssets;
  num? returnOnEquity;
  int? grossProfits;
  int? freeCashflow;
  int? operatingCashflow;
  num? earningsGrowth;
  num? revenueGrowth;
  num? grossMargins;
  num? ebitdaMargins;
  num? operatingMargins;
  num? profitMargins;
  String? financialCurrency;

  FinancialData(
      {this.maxAge,
      this.currentPrice,
      this.targetHighPrice,
      this.targetLowPrice,
      this.targetMeanPrice,
      this.targetMedianPrice,
      this.recommendationMean,
      this.recommendationKey,
      this.numberOfAnalystOpinions,
      this.totalCash,
      this.totalCashPerShare,
      this.ebitda,
      this.totalDebt,
      this.quickRatio,
      this.currentRatio,
      this.totalRevenue,
      this.debtToEquity,
      this.revenuePerShare,
      this.returnOnAssets,
      this.returnOnEquity,
      this.grossProfits,
      this.freeCashflow,
      this.operatingCashflow,
      this.earningsGrowth,
      this.revenueGrowth,
      this.grossMargins,
      this.ebitdaMargins,
      this.operatingMargins,
      this.profitMargins,
      this.financialCurrency});

  FinancialData.fromJson(Map<String, dynamic> json) {
    maxAge = json["maxAge"];
    currentPrice = json["currentPrice"];
    targetHighPrice = json["targetHighPrice"];
    targetLowPrice = json["targetLowPrice"];
    targetMeanPrice = json["targetMeanPrice"];
    targetMedianPrice = json["targetMedianPrice"];
    recommendationMean = json["recommendationMean"];
    recommendationKey = json["recommendationKey"];
    numberOfAnalystOpinions = json["numberOfAnalystOpinions"];
    totalCash = json["totalCash"];
    totalCashPerShare = json["totalCashPerShare"];
    ebitda = json["ebitda"];
    totalDebt = json["totalDebt"];
    quickRatio = json["quickRatio"];
    currentRatio = json["currentRatio"];
    totalRevenue = json["totalRevenue"];
    debtToEquity = json["debtToEquity"];
    revenuePerShare = json["revenuePerShare"];
    returnOnAssets = json["returnOnAssets"];
    returnOnEquity = json["returnOnEquity"];
    grossProfits = json["grossProfits"];
    freeCashflow = json["freeCashflow"];
    operatingCashflow = json["operatingCashflow"];
    earningsGrowth = json["earningsGrowth"];
    revenueGrowth = json["revenueGrowth"];
    grossMargins = json["grossMargins"];
    ebitdaMargins = json["ebitdaMargins"];
    operatingMargins = json["operatingMargins"];
    profitMargins = json["profitMargins"];
    financialCurrency = json["financialCurrency"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["maxAge"] = maxAge;
    _data["currentPrice"] = currentPrice;
    _data["targetHighPrice"] = targetHighPrice;
    _data["targetLowPrice"] = targetLowPrice;
    _data["targetMeanPrice"] = targetMeanPrice;
    _data["targetMedianPrice"] = targetMedianPrice;
    _data["recommendationMean"] = recommendationMean;
    _data["recommendationKey"] = recommendationKey;
    _data["numberOfAnalystOpinions"] = numberOfAnalystOpinions;
    _data["totalCash"] = totalCash;
    _data["totalCashPerShare"] = totalCashPerShare;
    _data["ebitda"] = ebitda;
    _data["totalDebt"] = totalDebt;
    _data["quickRatio"] = quickRatio;
    _data["currentRatio"] = currentRatio;
    _data["totalRevenue"] = totalRevenue;
    _data["debtToEquity"] = debtToEquity;
    _data["revenuePerShare"] = revenuePerShare;
    _data["returnOnAssets"] = returnOnAssets;
    _data["returnOnEquity"] = returnOnEquity;
    _data["grossProfits"] = grossProfits;
    _data["freeCashflow"] = freeCashflow;
    _data["operatingCashflow"] = operatingCashflow;
    _data["earningsGrowth"] = earningsGrowth;
    _data["revenueGrowth"] = revenueGrowth;
    _data["grossMargins"] = grossMargins;
    _data["ebitdaMargins"] = ebitdaMargins;
    _data["operatingMargins"] = operatingMargins;
    _data["profitMargins"] = profitMargins;
    _data["financialCurrency"] = financialCurrency;
    return _data;
  }
}

class Price {
  int? maxAge;
  num? preMarketChangePercent;
  num? preMarketChange;
  String? preMarketTime;
  num? preMarketPrice;
  String? preMarketSource;
  num? postMarketChangePercent;
  num? postMarketChange;
  String? postMarketTime;
  num? postMarketPrice;
  String? postMarketSource;
  num? regularMarketChangePercent;
  num? regularMarketChange;
  String? regularMarketTime;
  int? priceHint;
  num? regularMarketPrice;
  num? regularMarketDayHigh;
  num? regularMarketDayLow;
  int? regularMarketVolume;
  int? averageDailyVolume10Day;
  int? averageDailyVolume3Month;
  num? regularMarketPreviousClose;
  String? regularMarketSource;
  num? regularMarketOpen;
  String? exchange;
  String? exchangeName;
  int? exchangeDataDelayedBy;
  String? marketState;
  String? quoteType;
  String? symbol;
  dynamic underlyingSymbol;
  String? shortName;
  String? longName;
  String? currency;
  String? quoteSourceName;
  String? currencySymbol;
  dynamic fromCurrency;
  dynamic toCurrency;
  dynamic lastMarket;
  int? marketCap;

  Price(
      {this.maxAge,
      this.preMarketChangePercent,
      this.preMarketChange,
      this.preMarketTime,
      this.preMarketPrice,
      this.preMarketSource,
      this.postMarketChangePercent,
      this.postMarketChange,
      this.postMarketTime,
      this.postMarketPrice,
      this.postMarketSource,
      this.regularMarketChangePercent,
      this.regularMarketChange,
      this.regularMarketTime,
      this.priceHint,
      this.regularMarketPrice,
      this.regularMarketDayHigh,
      this.regularMarketDayLow,
      this.regularMarketVolume,
      this.averageDailyVolume10Day,
      this.averageDailyVolume3Month,
      this.regularMarketPreviousClose,
      this.regularMarketSource,
      this.regularMarketOpen,
      this.exchange,
      this.exchangeName,
      this.exchangeDataDelayedBy,
      this.marketState,
      this.quoteType,
      this.symbol,
      this.underlyingSymbol,
      this.shortName,
      this.longName,
      this.currency,
      this.quoteSourceName,
      this.currencySymbol,
      this.fromCurrency,
      this.toCurrency,
      this.lastMarket,
      this.marketCap});

  Price.fromJson(Map<String, dynamic> json) {
    maxAge = json["maxAge"];
    preMarketChangePercent = json["preMarketChangePercent"];
    preMarketChange = json["preMarketChange"];
    preMarketTime = json["preMarketTime"];
    preMarketPrice = json["preMarketPrice"];
    preMarketSource = json["preMarketSource"];
    postMarketChangePercent = json["postMarketChangePercent"];
    postMarketChange = json["postMarketChange"];
    postMarketTime = json["postMarketTime"];
    postMarketPrice = json["postMarketPrice"];
    postMarketSource = json["postMarketSource"];
    regularMarketChangePercent = json["regularMarketChangePercent"];
    regularMarketChange = json["regularMarketChange"];
    regularMarketTime = json["regularMarketTime"];
    priceHint = json["priceHint"];
    regularMarketPrice = json["regularMarketPrice"];
    regularMarketDayHigh = json["regularMarketDayHigh"];
    regularMarketDayLow = json["regularMarketDayLow"];
    regularMarketVolume = json["regularMarketVolume"];
    averageDailyVolume10Day = json["averageDailyVolume10Day"];
    averageDailyVolume3Month = json["averageDailyVolume3Month"];
    regularMarketPreviousClose = json["regularMarketPreviousClose"];
    regularMarketSource = json["regularMarketSource"];
    regularMarketOpen = json["regularMarketOpen"];
    exchange = json["exchange"];
    exchangeName = json["exchangeName"];
    exchangeDataDelayedBy = json["exchangeDataDelayedBy"];
    marketState = json["marketState"];
    quoteType = json["quoteType"];
    symbol = json["symbol"];
    underlyingSymbol = json["underlyingSymbol"];
    shortName = json["shortName"];
    longName = json["longName"];
    currency = json["currency"];
    quoteSourceName = json["quoteSourceName"];
    currencySymbol = json["currencySymbol"];
    fromCurrency = json["fromCurrency"];
    toCurrency = json["toCurrency"];
    lastMarket = json["lastMarket"];
    marketCap = json["marketCap"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["maxAge"] = maxAge;
    _data["preMarketChangePercent"] = preMarketChangePercent;
    _data["preMarketChange"] = preMarketChange;
    _data["preMarketTime"] = preMarketTime;
    _data["preMarketPrice"] = preMarketPrice;
    _data["preMarketSource"] = preMarketSource;
    _data["postMarketChangePercent"] = postMarketChangePercent;
    _data["postMarketChange"] = postMarketChange;
    _data["postMarketTime"] = postMarketTime;
    _data["postMarketPrice"] = postMarketPrice;
    _data["postMarketSource"] = postMarketSource;
    _data["regularMarketChangePercent"] = regularMarketChangePercent;
    _data["regularMarketChange"] = regularMarketChange;
    _data["regularMarketTime"] = regularMarketTime;
    _data["priceHint"] = priceHint;
    _data["regularMarketPrice"] = regularMarketPrice;
    _data["regularMarketDayHigh"] = regularMarketDayHigh;
    _data["regularMarketDayLow"] = regularMarketDayLow;
    _data["regularMarketVolume"] = regularMarketVolume;
    _data["averageDailyVolume10Day"] = averageDailyVolume10Day;
    _data["averageDailyVolume3Month"] = averageDailyVolume3Month;
    _data["regularMarketPreviousClose"] = regularMarketPreviousClose;
    _data["regularMarketSource"] = regularMarketSource;
    _data["regularMarketOpen"] = regularMarketOpen;
    _data["exchange"] = exchange;
    _data["exchangeName"] = exchangeName;
    _data["exchangeDataDelayedBy"] = exchangeDataDelayedBy;
    _data["marketState"] = marketState;
    _data["quoteType"] = quoteType;
    _data["symbol"] = symbol;
    _data["underlyingSymbol"] = underlyingSymbol;
    _data["shortName"] = shortName;
    _data["longName"] = longName;
    _data["currency"] = currency;
    _data["quoteSourceName"] = quoteSourceName;
    _data["currencySymbol"] = currencySymbol;
    _data["fromCurrency"] = fromCurrency;
    _data["toCurrency"] = toCurrency;
    _data["lastMarket"] = lastMarket;
    _data["marketCap"] = marketCap;
    return _data;
  }
}

class SummaryDetail {
  int? maxAge;
  int? priceHint;
  num? previousClose;
  num? open;
  num? dayLow;
  num? dayHigh;
  num? regularMarketPreviousClose;
  num? regularMarketOpen;
  num? regularMarketDayLow;
  num? regularMarketDayHigh;
  num? dividendRate;
  num? dividendYield;
  String? exDividendDate;
  num? payoutRatio;
  num? beta;
  num? trailingPe;
  num? forwardPe;
  int? volume;
  int? regularMarketVolume;
  int? averageVolume;
  int? averageVolume10Days;
  int? averageDailyVolume10Day;
  num? bid;
  num? ask;
  int? bidSize;
  int? askSize;
  int? marketCap;
  num? fiftyTwoWeekLow;
  num? fiftyTwoWeekHigh;
  num? priceToSalesTrailing12Months;
  num? fiftyDayAverage;
  num? twoHundredDayAverage;
  num? trailingAnnualDividendRate;
  num? trailingAnnualDividendYield;
  String? currency;
  dynamic fromCurrency;
  dynamic toCurrency;
  dynamic lastMarket;
  dynamic coinMarketCapLink;
  dynamic algorithm;
  bool? tradeable;

  SummaryDetail(
      {this.maxAge,
      this.priceHint,
      this.previousClose,
      this.open,
      this.dayLow,
      this.dayHigh,
      this.regularMarketPreviousClose,
      this.regularMarketOpen,
      this.regularMarketDayLow,
      this.regularMarketDayHigh,
      this.dividendRate,
      this.dividendYield,
      this.exDividendDate,
      this.payoutRatio,
      this.beta,
      this.trailingPe,
      this.forwardPe,
      this.volume,
      this.regularMarketVolume,
      this.averageVolume,
      this.averageVolume10Days,
      this.averageDailyVolume10Day,
      this.bid,
      this.ask,
      this.bidSize,
      this.askSize,
      this.marketCap,
      this.fiftyTwoWeekLow,
      this.fiftyTwoWeekHigh,
      this.priceToSalesTrailing12Months,
      this.fiftyDayAverage,
      this.twoHundredDayAverage,
      this.trailingAnnualDividendRate,
      this.trailingAnnualDividendYield,
      this.currency,
      this.fromCurrency,
      this.toCurrency,
      this.lastMarket,
      this.coinMarketCapLink,
      this.algorithm,
      this.tradeable});

  SummaryDetail.fromJson(Map<String, dynamic> json) {
    maxAge = json["maxAge"];
    priceHint = json["priceHint"];
    previousClose = json["previousClose"];
    open = json["open"];
    dayLow = json["dayLow"];
    dayHigh = json["dayHigh"];
    regularMarketPreviousClose = json["regularMarketPreviousClose"];
    regularMarketOpen = json["regularMarketOpen"];
    regularMarketDayLow = json["regularMarketDayLow"];
    regularMarketDayHigh = json["regularMarketDayHigh"];
    dividendRate = json["dividendRate"];
    dividendYield = json["dividendYield"];
    exDividendDate = json["exDividendDate"];
    payoutRatio = json["payoutRatio"];
    beta = json["beta"];
    trailingPe = json["trailingPE"];
    forwardPe = json["forwardPE"];
    volume = json["volume"];
    regularMarketVolume = json["regularMarketVolume"];
    averageVolume = json["averageVolume"];
    averageVolume10Days = json["averageVolume10days"];
    averageDailyVolume10Day = json["averageDailyVolume10Day"];
    bid = json["bid"];
    ask = json["ask"];
    bidSize = json["bidSize"];
    askSize = json["askSize"];
    marketCap = json["marketCap"];
    fiftyTwoWeekLow = json["fiftyTwoWeekLow"];
    fiftyTwoWeekHigh = json["fiftyTwoWeekHigh"];
    priceToSalesTrailing12Months = json["priceToSalesTrailing12Months"];
    fiftyDayAverage = json["fiftyDayAverage"];
    twoHundredDayAverage = json["twoHundredDayAverage"];
    trailingAnnualDividendRate = json["trailingAnnualDividendRate"];
    trailingAnnualDividendYield = json["trailingAnnualDividendYield"];
    currency = json["currency"];
    fromCurrency = json["fromCurrency"];
    toCurrency = json["toCurrency"];
    lastMarket = json["lastMarket"];
    coinMarketCapLink = json["coinMarketCapLink"];
    algorithm = json["algorithm"];
    tradeable = json["tradeable"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["maxAge"] = maxAge;
    _data["priceHint"] = priceHint;
    _data["previousClose"] = previousClose;
    _data["open"] = open;
    _data["dayLow"] = dayLow;
    _data["dayHigh"] = dayHigh;
    _data["regularMarketPreviousClose"] = regularMarketPreviousClose;
    _data["regularMarketOpen"] = regularMarketOpen;
    _data["regularMarketDayLow"] = regularMarketDayLow;
    _data["regularMarketDayHigh"] = regularMarketDayHigh;
    _data["dividendRate"] = dividendRate;
    _data["dividendYield"] = dividendYield;
    _data["exDividendDate"] = exDividendDate;
    _data["payoutRatio"] = payoutRatio;
    _data["beta"] = beta;
    _data["trailingPE"] = trailingPe;
    _data["forwardPE"] = forwardPe;
    _data["volume"] = volume;
    _data["regularMarketVolume"] = regularMarketVolume;
    _data["averageVolume"] = averageVolume;
    _data["averageVolume10days"] = averageVolume10Days;
    _data["averageDailyVolume10Day"] = averageDailyVolume10Day;
    _data["bid"] = bid;
    _data["ask"] = ask;
    _data["bidSize"] = bidSize;
    _data["askSize"] = askSize;
    _data["marketCap"] = marketCap;
    _data["fiftyTwoWeekLow"] = fiftyTwoWeekLow;
    _data["fiftyTwoWeekHigh"] = fiftyTwoWeekHigh;
    _data["priceToSalesTrailing12Months"] = priceToSalesTrailing12Months;
    _data["fiftyDayAverage"] = fiftyDayAverage;
    _data["twoHundredDayAverage"] = twoHundredDayAverage;
    _data["trailingAnnualDividendRate"] = trailingAnnualDividendRate;
    _data["trailingAnnualDividendYield"] = trailingAnnualDividendYield;
    _data["currency"] = currency;
    _data["fromCurrency"] = fromCurrency;
    _data["toCurrency"] = toCurrency;
    _data["lastMarket"] = lastMarket;
    _data["coinMarketCapLink"] = coinMarketCapLink;
    _data["algorithm"] = algorithm;
    _data["tradeable"] = tradeable;
    return _data;
  }
}

class AssetProfile {
  String? address1;
  String? address2;
  String? city;
  String? state;
  String? zip;
  String? country;
  String? phone;
  String? website;
  String? industry;
  String? sector;
  String? longBusinessSummary;
  int? fullTimeEmployees;
  List<CompanyOfficers>? companyOfficers;
  int? auditRisk;
  int? boardRisk;
  int? compensationRisk;
  int? shareHolderRightsRisk;
  int? overallRisk;
  String? governanceEpochDate;
  int? maxAge;

  AssetProfile(
      {this.address1,
      this.address2,
      this.city,
      this.state,
      this.zip,
      this.country,
      this.phone,
      this.website,
      this.industry,
      this.sector,
      this.longBusinessSummary,
      this.fullTimeEmployees,
      this.companyOfficers,
      this.auditRisk,
      this.boardRisk,
      this.compensationRisk,
      this.shareHolderRightsRisk,
      this.overallRisk,
      this.governanceEpochDate,
      this.maxAge});

  AssetProfile.fromJson(Map<String, dynamic> json) {
    address1 = json["address1"];
    address2 = json["address2"];
    city = json["city"];
    state = json["state"];
    zip = json["zip"];
    country = json["country"];
    phone = json["phone"];
    website = json["website"];
    industry = json["industry"];
    sector = json["sector"];
    longBusinessSummary = json["longBusinessSummary"];
    fullTimeEmployees = json["fullTimeEmployees"];
    companyOfficers = json["companyOfficers"] == null
        ? null
        : (json["companyOfficers"] as List)
            .map((e) => CompanyOfficers.fromJson(e))
            .toList();
    auditRisk = json["auditRisk"];
    boardRisk = json["boardRisk"];
    compensationRisk = json["compensationRisk"];
    shareHolderRightsRisk = json["shareHolderRightsRisk"];
    overallRisk = json["overallRisk"];
    governanceEpochDate = json["governanceEpochDate"];
    maxAge = json["maxAge"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["address1"] = address1;
    _data["address2"] = address2;
    _data["city"] = city;
    _data["state"] = state;
    _data["zip"] = zip;
    _data["country"] = country;
    _data["phone"] = phone;
    _data["website"] = website;
    _data["industry"] = industry;
    _data["sector"] = sector;
    _data["longBusinessSummary"] = longBusinessSummary;
    _data["fullTimeEmployees"] = fullTimeEmployees;
    if (companyOfficers != null) {
      _data["companyOfficers"] =
          companyOfficers?.map((e) => e.toJson()).toList();
    }
    _data["auditRisk"] = auditRisk;
    _data["boardRisk"] = boardRisk;
    _data["compensationRisk"] = compensationRisk;
    _data["shareHolderRightsRisk"] = shareHolderRightsRisk;
    _data["overallRisk"] = overallRisk;
    _data["governanceEpochDate"] = governanceEpochDate;
    _data["maxAge"] = maxAge;
    return _data;
  }
}

class CompanyOfficers {
  int? maxAge;
  String? name;
  int? age;
  String? title;
  int? yearBorn;
  int? exercisedValue;
  int? unexercisedValue;

  CompanyOfficers(
      {this.maxAge,
      this.name,
      this.age,
      this.title,
      this.yearBorn,
      this.exercisedValue,
      this.unexercisedValue});

  CompanyOfficers.fromJson(Map<String, dynamic> json) {
    maxAge = json["maxAge"];
    name = json["name"];
    age = json["age"];
    title = json["title"];
    yearBorn = json["yearBorn"];
    exercisedValue = json["exercisedValue"];
    unexercisedValue = json["unexercisedValue"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["maxAge"] = maxAge;
    _data["name"] = name;
    _data["age"] = age;
    _data["title"] = title;
    _data["yearBorn"] = yearBorn;
    _data["exercisedValue"] = exercisedValue;
    _data["unexercisedValue"] = unexercisedValue;
    return _data;
  }
}
