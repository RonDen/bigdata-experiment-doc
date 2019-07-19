ssh-copy-id master
ssh-copy-id slave1
ssh-copy-id slave2
# 测试是否正常将公钥分发完成免密登录
ssh master
ssh slave1
ssh slave2
