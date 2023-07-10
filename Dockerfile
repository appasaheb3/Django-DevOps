FROM python:3.9
WORKDIR /note
COPY requirements.txt note
RUN pip install -r requirements.txt
COPY . /note
EXPOSE 8000
CMD python manage.py runserver 0.0.0.0:8000