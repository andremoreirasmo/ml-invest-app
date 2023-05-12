import 'package:ml_invest_app/shared/models/trend_stock_enum.dart';

class StockModel {
  num? id;
  String? name;
  String? image;
  String? ticker;
  TrendStockEnum? trend;
  num? stockStatus;
  Summary? summary;
  List<StockChartModel>? chart;

  StockModel(
      {this.id,
      this.name,
      this.image,
      this.ticker,
      this.stockStatus,
      this.summary,
      this.chart});

  StockModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    image = json["image"];
    ticker = json["ticker"];
    stockStatus = json["stockStatus"];
    summary =
        json["summary"] == null ? null : Summary.fromJson(json["summary"]);
    chart = json["chart"] == null
        ? null
        : (json["chart"] as List)
            .map((e) => StockChartModel.fromJson(e))
            .toList();
    trend = trendStockFromJson(json["trendStock"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["image"] = image;
    _data["ticker"] = ticker;
    _data["stockStatus"] = stockStatus;
    if (summary != null) {
      _data["summary"] = summary?.toJson();
    }
    if (chart != null) {
      _data["chart"] = chart?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class StockChartModel {
  DateTime? date;
  num? high;
  num? close;
  num? volume;
  num? open;
  num? low;

  StockChartModel(
      {this.date, this.high, this.close, this.volume, this.open, this.low});

  StockChartModel.fromJson(Map<String, dynamic> json) {
    date = DateTime.parse(json["date"]);
    high = json["high"];
    close = json["close"];
    volume = json["volume"];
    open = json["open"];
    low = json["low"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["date"] = date;
    _data["high"] = high;
    _data["close"] = close;
    _data["volume"] = volume;
    _data["open"] = open;
    _data["low"] = low;
    return _data;
  }
}

class Summary {
  AssetProfile? assetProfile;
  SummaryDetail? summaryDetail;
  SummaryProfile? summaryProfile;
  QuoteType? quoteType;
  Price? price;

  Summary(
      {this.assetProfile,
      this.summaryDetail,
      this.summaryProfile,
      this.quoteType,
      this.price});

  Summary.fromJson(Map<String, dynamic> json) {
    assetProfile = json["assetProfile"] == null
        ? null
        : AssetProfile.fromJson(json["assetProfile"]);
    summaryDetail = json["summaryDetail"] == null
        ? null
        : SummaryDetail.fromJson(json["summaryDetail"]);
    summaryProfile = json["summaryProfile"] == null
        ? null
        : SummaryProfile.fromJson(json["summaryProfile"]);
    quoteType = json["quoteType"] == null
        ? null
        : QuoteType.fromJson(json["quoteType"]);
    price = json["price"] == null ? null : Price.fromJson(json["price"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (assetProfile != null) {
      _data["assetProfile"] = assetProfile?.toJson();
    }
    if (summaryDetail != null) {
      _data["summaryDetail"] = summaryDetail?.toJson();
    }
    if (summaryProfile != null) {
      _data["summaryProfile"] = summaryProfile?.toJson();
    }
    if (quoteType != null) {
      _data["quoteType"] = quoteType?.toJson();
    }
    if (price != null) {
      _data["price"] = price?.toJson();
    }
    return _data;
  }
}

class Price {
  num? maxAge;
  num? regularMarketChangePercent;
  num? regularMarketChange;
  String? regularMarketTime;
  num? priceHnum;
  num? regularMarketPrice;
  num? regularMarketDayHigh;
  num? regularMarketDayLow;
  num? regularMarketVolume;
  num? averageDailyVolume10Day;
  num? averageDailyVolume3Month;
  num? regularMarketPreviousClose;
  String? regularMarketSource;
  num? regularMarketOpen;
  String? exchange;
  String? exchangeName;
  num? exchangeDataDelayedBy;
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
  num? marketCap;

  Price(
      {this.maxAge,
      this.regularMarketChangePercent,
      this.regularMarketChange,
      this.regularMarketTime,
      this.priceHnum,
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
    regularMarketChangePercent = json["regularMarketChangePercent"];
    regularMarketChange = json["regularMarketChange"];
    regularMarketTime = json["regularMarketTime"];
    priceHnum = json["priceHnum"];
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
    _data["regularMarketChangePercent"] = regularMarketChangePercent;
    _data["regularMarketChange"] = regularMarketChange;
    _data["regularMarketTime"] = regularMarketTime;
    _data["priceHnum"] = priceHnum;
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

class QuoteType {
  String? exchange;
  String? quoteType;
  String? symbol;
  String? underlyingSymbol;
  String? shortName;
  String? longName;
  String? firstTradeDateEpochUtc;
  String? timeZoneFullName;
  String? timeZoneShortName;
  String? uuid;
  String? messageBoardId;
  num? gmtOffSetMilliseconds;
  num? maxAge;

  QuoteType(
      {this.exchange,
      this.quoteType,
      this.symbol,
      this.underlyingSymbol,
      this.shortName,
      this.longName,
      this.firstTradeDateEpochUtc,
      this.timeZoneFullName,
      this.timeZoneShortName,
      this.uuid,
      this.messageBoardId,
      this.gmtOffSetMilliseconds,
      this.maxAge});

  QuoteType.fromJson(Map<String, dynamic> json) {
    exchange = json["exchange"];
    quoteType = json["quoteType"];
    symbol = json["symbol"];
    underlyingSymbol = json["underlyingSymbol"];
    shortName = json["shortName"];
    longName = json["longName"];
    firstTradeDateEpochUtc = json["firstTradeDateEpochUtc"];
    timeZoneFullName = json["timeZoneFullName"];
    timeZoneShortName = json["timeZoneShortName"];
    uuid = json["uuid"];
    messageBoardId = json["messageBoardId"];
    gmtOffSetMilliseconds = json["gmtOffSetMilliseconds"];
    maxAge = json["maxAge"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["exchange"] = exchange;
    _data["quoteType"] = quoteType;
    _data["symbol"] = symbol;
    _data["underlyingSymbol"] = underlyingSymbol;
    _data["shortName"] = shortName;
    _data["longName"] = longName;
    _data["firstTradeDateEpochUtc"] = firstTradeDateEpochUtc;
    _data["timeZoneFullName"] = timeZoneFullName;
    _data["timeZoneShortName"] = timeZoneShortName;
    _data["uuid"] = uuid;
    _data["messageBoardId"] = messageBoardId;
    _data["gmtOffSetMilliseconds"] = gmtOffSetMilliseconds;
    _data["maxAge"] = maxAge;
    return _data;
  }
}

class SummaryProfile {
  String? address1;
  String? address2;
  String? city;
  String? state;
  String? zip;
  String? country;
  String? phone;
  String? website;
  String? industry;
  String? industryDisp;
  String? sector;
  String? longBusinessSummary;
  num? fullTimeEmployees;
  List<dynamic>? companyOfficers;
  num? maxAge;

  SummaryProfile(
      {this.address1,
      this.address2,
      this.city,
      this.state,
      this.zip,
      this.country,
      this.phone,
      this.website,
      this.industry,
      this.industryDisp,
      this.sector,
      this.longBusinessSummary,
      this.fullTimeEmployees,
      this.companyOfficers,
      this.maxAge});

  SummaryProfile.fromJson(Map<String, dynamic> json) {
    address1 = json["address1"];
    address2 = json["address2"];
    city = json["city"];
    state = json["state"];
    zip = json["zip"];
    country = json["country"];
    phone = json["phone"];
    website = json["website"];
    industry = json["industry"];
    industryDisp = json["industryDisp"];
    sector = json["sector"];
    longBusinessSummary = json["longBusinessSummary"];
    fullTimeEmployees = json["fullTimeEmployees"];
    companyOfficers = json["companyOfficers"] ?? [];
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
    _data["industryDisp"] = industryDisp;
    _data["sector"] = sector;
    _data["longBusinessSummary"] = longBusinessSummary;
    _data["fullTimeEmployees"] = fullTimeEmployees;
    if (companyOfficers != null) {
      _data["companyOfficers"] = companyOfficers;
    }
    _data["maxAge"] = maxAge;
    return _data;
  }
}

class SummaryDetail {
  num? maxAge;
  num? priceHnum;
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
  DateTime? exDividendDate;
  num? payoutRatio;
  num? fiveYearAvgDividendYield;
  num? beta;
  num? trailingPe;
  num? forwardPe;
  num? volume;
  num? regularMarketVolume;
  num? averageVolume;
  num? averageVolume10Days;
  num? averageDailyVolume10Day;
  num? bid;
  num? ask;
  num? bidSize;
  num? askSize;
  num? marketCap;
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
      this.priceHnum,
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
      this.fiveYearAvgDividendYield,
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
    priceHnum = json["priceHnum"];
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
    exDividendDate = DateTime.parse(json["exDividendDate"]);
    payoutRatio = json["payoutRatio"];
    fiveYearAvgDividendYield = json["fiveYearAvgDividendYield"];
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
    _data["priceHnum"] = priceHnum;
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
    _data["fiveYearAvgDividendYield"] = fiveYearAvgDividendYield;
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
  String? industryDisp;
  String? sector;
  String? longBusinessSummary;
  num? fullTimeEmployees;
  List<CompanyOfficers>? companyOfficers;
  num? auditRisk;
  num? boardRisk;
  num? compensationRisk;
  num? shareHolderRightsRisk;
  num? overallRisk;
  String? governanceEpochDate;
  num? maxAge;

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
      this.industryDisp,
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
    industryDisp = json["industryDisp"];
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
    _data["industryDisp"] = industryDisp;
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
  num? maxAge;
  String? name;
  num? age;
  String? title;
  num? yearBorn;
  num? exercisedValue;
  num? unexercisedValue;

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
