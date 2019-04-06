/// 日K线
/// http://web.ifzq.gtimg.cn/appstock/app/fqkline/get?_var=kline_dayqfq&param=sh600000,day,,,320,qfq&r=0.2557841779849601

String UrlForKLine(String symbol) {
// return "http://web.ifzq.gtimg.cn/appstock/app/fqkline/get?_var=kline_dayqfq&param=$symbol,day,,,320,qfq&r=0.2557841779849601";
  return "http://web.ifzq.gtimg.cn/appstock/app/fqkline/get?_var=kline_dayqfq&param=$symbol,day,,,320,qfq&r=0.6793459674465414";
}

/// 资讯
/// http://web.ifzq.gtimg.cn/appstock/hs/tzld/get?code=sh600000&_var=gg_tzld&_=1548163385713

/// http://web.ifzq.gtimg.cn/appstock/hs/gszl/get?code=sh600000&type=gsgk_tips&_callback=jQuery112408302442511559622_1548163385705&_=1548163385706

/// 提示
/// http://web.ifzq.gtimg.cn/appstock/hs/tzts/get?type=tips&_var=v_tztips&limit=3&code=sh600000&page=1&_=1548163385694
///
/// http://web.ifzq.gtimg.cn/appstock/hs/gszl/get?code=sh600000&type=gsgk_tips&_callback=jQuery112408302442511559622_1548163385705&_=1548163385706

/// http://web.ifzq.gtimg.cn/appstock/hs/hypm/get?code=sh600000&_var=gg_hypm&_=1548163385707

/// 业绩报告
/// http://web.ifzq.gtimg.cn/appstock/hs/yjbg/get?type=tips&page=1&code=sh600000&limit=8&_var=gg_yjbg&_=1548163385710

/// http://web.ifzq.gtimg.cn/appstock/news/HyNews/getBySymbol?symbol=sh600000&_var=finance_hyzx&_=1548163385711
///
/// http://web.ifzq.gtimg.cn/appstock/hs/jggd/get?_var=jggd_data&code=sh600000&_=1548163385712
///
/// http://web.ifzq.gtimg.cn/appstock/hs/tzld/get?code=sh600000&_var=gg_tzld&_=1548163385713
///
/// http://web.ifzq.gtimg.cn/appstock/hs/ltgd/get?type=ltgd&_var=v_liutonggd&code=sh600000&_=1548163385714

// ## 证券列表
// http://stock.gtimg.cn/data/index.php?appn=rank&t=ranka/chr&p=1&o=0&l=40&v=list_data
// http://stock.gtimg.cn/data/index.php?appn=rank&t=ranka/chr&p=2&o=0&l=40&v=list_data
//
// http://stock.gtimg.cn/data/index.php?appn=rank&t=ranka/chr&p=2&o=0&l=80&v=list_data
//
// var list_data={t:'ranka/chr',p:2,total:45,l:80,o:0,data:'sz300046,sz300456,sh600289,sh601066,sh600238,sz300701,sz300387,sh600421,sh603986,sz300496,sz002712,sz002790,sh603218,sz002569,sh600622,sz300474,sh603501,sz000880,sz300604,sz300711,sz300367,sh600235,sh603665,sz002156,sz000639,sz300566,sz002531,sz002185,sz002459,sz300573,sh600830,sz300077,sz002409,sz300013,sz300571,sz300232,sz002180,sz002467,sz002129,sz300502,sh600301,sz300139,sz300655,sh603578,sh600588,sz002217,sz300352,sz002551,sz300494,sz300671,sh600073,sz002508,sh603131,sz002373,sz000066,sz300623,sh600093,sz300346,sz002588,sh600360,sz000591,sz300567,sh600667,sh601808,sh603519,sh603283,sz002458,sz002218,sz002576,sz300317,sz002690,sh603678,sz002023,sh600770,sz002384,sz300316,sz002616,sz000733,sz000938,sh603966'};
//
// ### 沪深A股
// http://stock.gtimg.cn/data/index.php?appn=rank&t=rankash/chr&p=1&o=0&l=80&v=list_data
//
// ### 沪A涨幅
// http://stock.gtimg.cn/data/view/rank.php?t=rankash/chr&p=1&o=0&l=40&v=list_data
//
//
// http://qt.gtimg.cn/q=sh600178,sh600748,sz300333,sz002699,sz300354,sz300096,sh600478,sz002369,sh603017,sz300274,sh600841,sh600280,sh603700,sh603332,sz300302,sz002079,sh600460,sh603220,sz002170,sz300613,sz002565,sz000570,sh603739,sz300684,sz002875&r=316978147
