puts "這個種子檔會自動建立一個admin帳號, 並且創建 10 個 public jobs, 以及10個hidden jobs"

create_account = User.create([email: '1@qq.com', password: '111111', password_confirmation: '111111', is_admin: 'true'])
puts "Admin account created."
