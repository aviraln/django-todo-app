FROM python:3
RUN pip install django==3.2
COPY . . 
RUN python3 manage.py migrate
EXPOSE 8002
CMD ["python3", "manage.py", "runserver", "0.0.0.0:8002"]




