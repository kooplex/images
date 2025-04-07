FROM base-jupyter_ubuntu24-v8

RUN apt update && apt install -y --no-install-recommends \
 graphviz graphviz-dev libcudart12 && \
 apt-get clean && rm -rf /var/lib/apt/lists/*

RUN . /opt/python-packages/bin/activate && uv pip install notebook poetry poetry-kernel sqlalchemy ipython-sql\
   langchain-openai=="0.1.8" langchain-community=="0.2.1" langchain=="0.2.1"\
   pymysql=="1.1.1" chromadb=="0.5.0" ipykernel=="6.29.4" langchainhub=="0.1.17"\
   gpt4all=="2.6.0" langchain-chroma=="0.1.1" bs4=="0.0.2" llama-cpp-python=="0.2.76"\
   psycopg2=="2.9.9" langchain-experimental=="0.0.60" openlm=="0.0.5" openllm=="0.5.7" pygraphviz psycopg2
#RUN . /opt/python-packages/bin/activate && uv pip install notebook=="6.5.5" poetry poetry-kernel sqlalchemy ipython-sql\
#   langchain-openai langchain-community langchain\
#   pymysql chromadb ipykernel langchainhub\
#   gpt4all langchain-chroma bs4 llama-cpp-python\
#   psycopg2 langchain-experimental openlm openllm
RUN . /opt/python-packages/bin/activate && uv pip install jupyter
WORKDIR /




