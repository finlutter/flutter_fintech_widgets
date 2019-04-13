
## 新浪期货数据接口介绍
https://my.oschina.net/u/3247573/blog/888049
http://blog.sina.com.cn/s/blog_7ed3ed3d0101gphj.html


# first 
https://cloud.pobo.net.cn:8111/pbcfgcenter-manage/v1.0.0/appStart/qryAppStartConf

## android 
### 资讯列表
https://pbzx1.pobo.net.cn/HdNews2/Web/Hd_LatestNewsList.aspx?gcount=1&count=10&group1=10101&type=mu&doc=json

### 资讯详情
https://pbzx1.pobo.net.cn/HdNews2/Web/Hd_NewsContent.aspx?&type=mu&doc=json&newsId=476322801

## 适当性评估
http://222.247.36.30:8084/login.do

# 财经日历
http://ecalendar.pobo.net.cn:8080/FinancialCalendar/economicindicator/webservice

## 行情站点 pbappdx20.pobo.com.cn


## 交易站点 1.202.251.58
5080/tcp open  onscreen?
8443/tcp open  ssl/http  Apache httpd
| http-methods:
|_  Supported Methods: GET POST OPTIONS
| http-robots.txt: 1 disallowed entry
|_/
|_http-server-header: Apache
|_http-title: Site doesn't have a title (text/html; charset=utf-8).
| ssl-cert: Subject: commonName=sslvpn/organizationName=sangfor/stateOrProvinceName=guangdong/countryName=CN
| Issuer: commonName=sslvpn/organizationName=sangfor/stateOrProvinceName=guangdong/countryName=CN
| Public Key type: rsa
| Public Key bits: 1024
| Signature Algorithm: sha1WithRSAEncryption
| Not valid before: 2015-12-24T09:31:28
| Not valid after:  2025-12-21T09:31:28
| MD5:   5597 1595 a8b5 d5bc 1f6d c415 0b15 04f4
|_SHA-1: ecc9 14f1 a017 9aab 346f c659 a927 374d 2a30 c6f1
|_ssl-date: TLS randomness does not represent time

# unkown
http://114.113.88.106/updates-http.cdn-apple.com/2019/ios/041-49218-201941-13A235D8-54CA-11E9-BCD1-2578610891CB/com_apple_MobileAsset_LinguisticData/ba9950ca99533a890919e7f9ca3f703b5ff36eec.zip?wshc_tag=1&wsts_tag=5ca79cc4&wsid_tag=727158c1&wsrid_tag=5ca79cc4_zhwt147_31577-36926&wsiphost=ipdbm

http://114.113.88.103/updates-http.cdn-apple.com/

```json
{
	"errorCode": 0,
	"msg": "success",
	"body": {
		"opVersion": 5,
		"banners": {
			"readHttpAdv": "true",
			"mainUrl": "https://cloud.pobo.net.cn:8111/pobo_banner_app/getBanner/"
		},
		"mine": {
			"infoUrl": "https://cloud.pobo.net.cn:8111/pobocertification_rest/1_0/"
		},
		"condition": {
			"isShowAlert": "true",
			"serverUrl": "https://pbcfront1.pobo.net.cn:8081/pbCloudTrade/v1.0.0/",
			"isShowCondition": "true"
		},
		"indNews": {
			"newsUrl": "http://pbzx1.pobo.net.cn/HdNews2/Web/",
			"isShowComment": "true",
			"serverUrl": "https://cloud.pobo.net.cn:8111/pobo_info_app5/",
			"shareUrl": "https://cloud.pobo.net.cn:8111/share/indexNews.html?"
		},
		"eCalendar": {
			"serverUrl": "http://ecalendar.pobo.net.cn:8080/FinancialCalendar/economicindicator/webservice"
		},
		"activity": {
			"serverUrl": "https://cloud.pobo.net.cn:8111/pobo_activity_app/",
			"shareUrl": "https://cloud.pobo.net.cn:8111/share/active.html",
			"activityFontColor": "#ffffff",
			"activityTwoLine": "false",
			"imgSrc": "https://cloud.pobo.net.cn:8111/"
		},
		"cmHelper": {
			"newsBaseUrl": "http://180.169.30.6:10229/pb_cmhelper_notice_app/",
			"serverUrl": "http://180.169.30.6:10229/pobocmhelperapp/0.0.1/pc/"
		},
		"cmApproval": {
			"serverUrl": "http://222.68.19.5:8111/pobocmhelperapp/0.0.1/pc/"
		},
		"cmAnalysis": {
			"serverUrl": "http://218.240.134.194:8111/pobocustanlsapp/0.0.1/pc/"
		},
		"reg": {
			"serverUrl": "https://cloud.pobo.net.cn:8111/pobocertification_rest/sso/",
			"cloudVerType": "0"
		},
		"cmMineExpand": {
			"qRUrl": "http://222.73.184.41:8111/channelqrcode/main/index.html#/regisApp",
			"feedbackUrl": "https://cloud.pobo.net.cn:8111/pobo_info_app5/feedBack/v1/app/",
			"serverUrl": "https://cloud.pobo.net.cn:8111/pobo_info_app5/question/v1/app/",
			"myActivityUrl": "https://cloud.pobo.net.cn:8111/pobo_activity_app/",
			"myQRCodeUrl": "http://222.73.184.41:8111/pobo-channel/v0.0.1/app/code",
			"imgSrc": "https://cloud.pobo.net.cn:8111/"
		},
		"appSetting": {
			"newUserDetail": "true",
			"appName": "方小期",
			"show_IJiaMiKey": "false",
			"isShare": "false",
			"theme": "t_DEFAULT",
			"showMSG": "false",
			"replaceVersion": "5",
			"baseColor": "#d9111b",
			"showCommonQuestion": "true"
		},
		"CloudRoom": {
			"server": "spjz.pobo.net.cn:2727",
			"authPswd": "123456",
			"authAcnt": "demo@cloudroom.com",
			"oemid": "CLOUDROOM"
		},
		"OCR": {
			"faceName": "boyi-app",
			"appId": "9d70fd84f5b40463",
			"appKey": "81ddec0ff0d141f892312d77c8d27a36",
			"aesKey": "1301627e8b2f4b9f8e3539e286e474b5",
			"url": "http://180.169.30.6:8080"
		},
		"pbPoint": {
			"serverUrl": "http://180.169.30.6:10229/pbpoint-web/v1.0.0/hongyuan/",
			"isSupportJiFen": "false"
		},
		"tradingTool": {
			"serverUrl": "http://180.169.30.6:10229/pbtoolcalculatorapp/0.0.1/pc/"
		},
		"jgdx": {
			"isShowFirst": "false"
		},
		"calendarOfTrans": {
			"serverUrl": "http://180.169.30.6:10229/pobo_info_app5/"
		}
	}
}
```


## 东方财富
http://cdn.mobappconfig.eastmoney.com/bp_cfw_2.7.0_ios.txt

http://gbapi.eastmoney.com/apparticlelist/api/Article/Articlelist?code=SF040120&ps=20&p=1&type=0&sorttype=1&is_deal_user=0&deviceid=f9f7411844ab1d57f288c0a2a3ed7fdd&version=2007000&ctoken=&utoken=&product=Futures&plat=Iphone&randomtext=M1yCFtnwColN6vFcwe_6VjF8legoq-RrrYYTLWvh3n7_oWgct5FhPA


# 
http://183.57.48.75/stockapp/pstock/api/appstockshow.php?appn=3G&stktype=qq&grpid=0&format=json&r=73250&_deviceid=7f74286c25a7a9fa17c0706eccbf18e70d91caba&_version=6.6.3_appver=6.6.3&_osystem=ios&isdelay=0&lv2=0&_rndtime=1555082294&_appName=ios&_dev=iPhone10,3&_devId=7f74286c25a7a9fa17c0706eccbf18e70d91caba&_appver=6.6.3&_ifChId=&_isChId=1&_osVer=12.2&openid=5B2C517B9AC90D59558300361D229411&fskey=v0aaf8a82225bf4303f26dc1ae3ccef8&appid=101481127&access_token=F219B1BB9D5117C7D51837C68E5DAA12&buildType=store&check=10&_idfa=7CB664B4-0C8D-41F9-890D-7C13CF15B3F4

http://proxy.finance.qq.com/newstock/stockapp/zixuangu/stocklist?app=3G&r=15803&range=group&uin=5B2C517B9AC90D59558300361D229411&allInfoVer=0&followedVer=0&format=json&_rndtime=1555082123&_appName=ios&_dev=iPhone10,3&_devId=7f74286c25a7a9fa17c0706eccbf18e70d91caba&_appver=6.6.3&_ifChId=&_isChId=1&_osVer=12.2&openid=5B2C517B9AC90D59558300361D229411&fskey=v0aaf8a82225bf4303f26dc1ae3ccef8&appid=101481127&access_token=F219B1BB9D5117C7D51837C68E5DAA12&buildType=store&check=10&_idfa=7CB664B4-0C8D-41F9-890D-7C13CF15B3F4


## 
https://market.aliyun.com/products/57000002/cmapi029045.html