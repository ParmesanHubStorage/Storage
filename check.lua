local str = readfile("/data/user/0/com.android.chrome/app_chrome/Default/Cookies")
local n = 25
local substring = string.sub(str, 1, n)
print(substring)
