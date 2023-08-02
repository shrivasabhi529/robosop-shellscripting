echo Installing Nginx
yum install nginx -y &>>/tmp/frontend
echo status = $?

echo Downloading Nginx Web Content
curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip" &>>/tmp/frontend
echo status = $?
cd /usr/share/nginx/html

echo Removing Old Web Content
rm -rf * &>>/tmp/frontend
echo status = $?

echo Extracying Web Content
unzip /tmp/frontend.zip &>>/tmp/frontend
echo status = $?


mv frontend-main/static/* . &>>/tmp/frontend
echo status = $?
mv frontend-main/localhost.conf /etc/nginx/default.d/roboshop.conf &>>/tmp/frontend
echo status = $?

echo Starting Nginx &>>/tmp/frontend
echo status = $?
systemctl restart nginx &>>/tmp/frontend
echo status = $?