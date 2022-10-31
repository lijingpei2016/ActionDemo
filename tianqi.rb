require 'net/http'
require 'json'
require 'wechat_work_webhook'


def get_tianqi

    uri = URI('https://api.seniverse.com/v3/weather/now.json?key=SkClTztsYbJyABfXj&location=guangzhou&language=zh-Hans&unit=c')
    response = Net::HTTP.get_response(uri)

    dict = JSON.parse(response.body)

    results = dict['results']
    dict = results[0]
    now = dict['now']
    tianqi = now["text"]
    wendu = now["temperature"]

    ans = "广州天气：" + tianqi + ", " + wendu + "°"
    request(ans)
end

def request(tianqi)
    wechat = WechatWorkWebhook.new('https://qyapi.weixin.qq.com/cgi-bin/webhook/send?key=89a0a3c9-87dc-43a6-a567-a32db30680da')
    wechat.text(tianqi)
end

get_tianqi



