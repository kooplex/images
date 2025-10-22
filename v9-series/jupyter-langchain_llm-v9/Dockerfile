FROM base-jupyter_ubuntu24-v8

RUN pip install notebook poetry poetry-kernel sqlalchemy ipython-sql\
#   langchain-openai=="0.3.7" langchain-community=="0.3.18" langchain=="0.3.19"\
#   pymysql=="1.1.1" chromadb=="0.6.3" ipykernel=="6.29.4" langchainhub=="0.1.17"\
#   gpt4all=="2.8.2" langchain-chroma=="0.2.2" bs4=="0.0.2" llama-cpp-python=="0.2.76"\
#   psycopg2=="2.9.9" langchain-experimental=="0.3.4" openlm=="0.0.5" openllm=="0.5.7" openai=="1.64.0" \
#   langchain-openai=="0.3.7" langchain-community=="0.3.18" langchain=="0.3.19"\
   pymysql chromadb ipykernel langchainhub\
   gpt4all langchain-chroma bs4 llama-cpp-python\
   psycopg2 langchain-experimental openlm openllm  \
   langchain_contrib pydantic  
RUN pip install  pygraphviz streamlit_extras streamlit_elements sql_metadata langchain_ollama logger openai

RUN apt update && apt install -y --no-install-recommends \
 graphviz graphviz-dev  libcudart12 && \
 apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /

RUN pip install git+https://github.com/jegesm/texttosql_localllm





