FROM ubuntu 
RUN apt update -y 
RUN apt-get install python3 -y
RUN apt install pip -y 
COPY . .
RUN pip3 install -r requirements.txt
RUN python3 manage.py makemigrations
RUN python3 manage.py migrate 
EXPOSE 8000
CMD ["python3","manage.py","runserver 0.0.0.0:8000"]
