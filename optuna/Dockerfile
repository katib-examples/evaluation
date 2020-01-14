FROM tensorflow/tensorflow:1.14.0-py3

WORKDIR /usr/src/

RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple optuna

COPY optuna-main.py .

CMD ["python", "optuna-main.py"]
