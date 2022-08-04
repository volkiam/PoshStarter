$Account = read-host "Введите аккаунт для блокировки";
$PathAccount = dsquery * -filter "&(objectcategory=user)(sAMAccountName=$Account)" -uc;
IF ($PathAccount -ne $NULL) {
$AccountName = dsquery * -filter "&(objectcategory=user)(sAMAccountName=$Account)" -attr givenName -l -uc;
$AccountSName = dsquery * -filter "&(objectcategory=user)(sAMAccountName=$Account)" -attr sn -l -uc;
$AccountTitle = dsquery * -filter "&(objectcategory=user)(sAMAccountName=$Account)" -attr title -l -uc;
$AccountDepartment = dsquery * -filter "&(objectcategory=user)(sAMAccountName=$Account)" -attr department -l -uc;
$AccountCompany = dsquery * -filter "&(objectcategory=user)(sAMAccountName=$Account)" -attr company -l -uc;
$AccountTel = dsquery * -filter "&(objectcategory=user)(sAMAccountName=$Account)" -attr telephoneNumber -l -uc;
$DisabledDate = Get-Date -format d;
dsmod user $PathAccount -desc $DisabledDate -disabled yes -uc;
$dt = get-date -format 'MMM-yyyy';
md \\fserv\pst_backup$\$dt\$Account;
Set-Mailbox -HiddenFromAddressListsEnabled $true -Identity "$Account";
New-MailboxExportRequest -Mailbox "$Account" -FilePath \\fserv\pst_backup$\$dt\$Account\$Account.pst;
$OUBlocked = 'OU=Blocked,OU=Employees,DC=cityhall,DC=ru';
dsmove $PathAccount -newparent $OUBlocked -uc;
$enc = New-Object System.Text.utf8encoding
Send-MailMessage -From "IT-DEPT-NOTIFIER <itcorp@cityhall.ru>" -To "itdepart@cityhall.ru" -Encoding $enc -Subject "Пользователь $Account был заблокирован" -BodyAsHtml "Логин: <b>$Account</b><br />Сотрудник: <b>$AccountName $AccountSName</b><br />Телефон: <b>$AccountTel</b><br />Должность: <b>$AccountTitle</b><br />Департамент: <b>$AccountDepartment</b><br />Компания: <b>$AccountCompany</b><br /><hr />Это сообщение создано автоматически. Просьба не отвечать на него." -Priority High -SmtpServer mail.cityhall.ru;
} ELSE {
echo "Нет пользователя!"
}