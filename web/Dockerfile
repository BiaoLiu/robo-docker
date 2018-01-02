FROM alpine-python3.6
ENV PYTHONUNBUFFERED 1


ADD ../ /project/fz

WORKDIR /project/fz

RUN pip install -r requirements.txt

#RUN echo "daemon off;" >> /etc/nginx/nginx.conf

#EXPOSE 8012
#ENV PORT 8200

CMD ["uwsgi", "/project/fz/uwsgi.ini"]
