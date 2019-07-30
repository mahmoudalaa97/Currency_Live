

class BankDataList {
  List<BankData> data;

  BankDataList({this.data});

  BankDataList.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<BankData>();
      json['data'].forEach((v) {
        data.add(new BankData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BankData {
  int id;
  String name;
  String logo;
  String currencyCode;
  String lastUpdate;
  String bankUpdate;
  String oldSell;
  String oldBuy;
  String sell;
  String buy;
  String currency;
  String sellBars;
  String buyBars;

  BankData(
      {this.id,
        this.name,
        this.logo,
        this.currencyCode,
        this.lastUpdate,
        this.bankUpdate,
        this.oldSell,
        this.oldBuy,
        this.sell,
        this.buy,
        this.currency,
        this.sellBars,
        this.buyBars});

  BankData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
    currencyCode = json['currency_code'];
    lastUpdate = json['last_update'];
    bankUpdate = json['bank_update'];
    oldSell = json['old_sell'];
    oldBuy = json['old_buy'];
    sell = json['sell'];
    buy = json['buy'];
    currency = json['currency'];
    sellBars = json['sell_bars'];
    buyBars = json['buy_bars'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['logo'] = this.logo;
    data['currency_code'] = this.currencyCode;
    data['last_update'] = this.lastUpdate;
    data['bank_update'] = this.bankUpdate;
    data['old_sell'] = this.oldSell;
    data['old_buy'] = this.oldBuy;
    data['sell'] = this.sell;
    data['buy'] = this.buy;
    data['currency'] = this.currency;
    data['sell_bars'] = this.sellBars;
    data['buy_bars'] = this.buyBars;
    return data;
  }
}