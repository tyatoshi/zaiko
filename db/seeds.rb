d = Date.today
Trend.create(article: 10, increase: nil, decrease: nil, user_id:"1", zaiko_id:"1", created_at:p(d-10) )
Trend.create(article: 15, increase: 5, decrease: nil, user_id:"1", zaiko_id:"1", created_at:p(d-9) )
Trend.create(article: 14, increase: nil, decrease: -1, user_id:"1", zaiko_id:"1", created_at:p(d-9) )
Trend.create(article: 11, increase: nil, decrease: -3, user_id:"1", zaiko_id:"1", created_at:p(d-6) )
Trend.create(article: 11, increase: nil, decrease: -2, user_id:"1", zaiko_id:"1", created_at:p(d-3) )

Trend.create(article: 5, increase: nil, decrease: nil, user_id:"1", zaiko_id:"2", created_at:p(d-20) )
Trend.create(article: 4, increase: nil, decrease: -1, user_id:"1", zaiko_id:"2", created_at:p(d-15) )
Trend.create(article: 3, increase: nil, decrease: -1, user_id:"1", zaiko_id:"2", created_at:p(d-7) )
Trend.create(article: 8, increase: 5, decrease: nil, user_id:"1", zaiko_id:"2", created_at:p(d-2) )
Trend.create(article: 6, increase: nil, decrease: -2, user_id:"1", zaiko_id:"2", created_at:p(d-1) )
