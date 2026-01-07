#! /usr/bin/env python
# -*- coding: utf-8 -*-
"""
@summary: install image to kooplex hub using api token
@authors: József Stéger
          Dávid Visontai
"""
import argparse
import logging
import json
import requests
import os, pwd, sys
from pprint import pprint
from dotenv import load_dotenv

def ge(x: str, d):
    return os.getenv(x, d)

def _get(url):
    session = requests.Session()
    session.cookies.set('api_user', api_user)
    session.cookies.set('api_token', api_token)
    response = session.get(url)
    if response.status_code == 200:
        return response.json()
    session_close()
    raise Exception(f"Unexpected behaviour {response}")

def _post(url, data, file_path, api_token, api_user):
    session = requests.Session()
    session.cookies.set('api_user', api_user)
    session.cookies.set('api_token', api_token)
    kw = {}
    if data:
        kw['data']=data
    if file_path:
        config = open(file_path, 'rb') 
        kw['files']={'file': config}
    response = session.post(url, **kw)
    #print(response.request.headers)
    if response.status_code == 200:
        session.close()
        return response.json()
    raise Exception(f"Unexpected behaviour {response}")

def send_image_to_api(server, api_token, image_name):
    
    #userinfo = pwd.getpwuid(os.getuid())
    api_user = "wfct0p" #userinfo.pw_name
    
    if len(sys.argv)==4:
        upload_logo = True # sys.argv[3]
    #    url_api=url_api+"?modify=True/"
    else:
        upload_logo=False 
    url_api = f'https://{server}/hub/api/'
    if upload_logo:
        image_file_name = os.path.basename(file_path)
        url_api+=f"upload_logo/{image_file_name}/"
    else:
        url_api+="install_image/"
    print(f"HELLO {url_api}")
    file_path = f"{image_name}/config.yml"
    resp = _post(url_api, data="", file_path=file_path, api_token=api_token, api_user=api_user)
    print(resp)


def parse_args():
    p = argparse.ArgumentParser(description="Install Docker Image to Kooplex Platform using Hub API")
    p.add_argument("-i", "--image_name", help='Which image )')
    p.add_argument("-s", "--host_platform",  help="Which platform: e.g. k8plex.example.com )")
    # p.add_argument("-u", "--without-human", dest="hitl", action="store_true", help="Human in the loop (optional), default False")
    # p.add_argument("-d", "--message-db-path", dest="message_store_db_path", default="state.db", help="Path to sqlite state DB")
    # p.add_argument("--db-explorer-path", dest="db_explorer", default=DATABASE_EXPLORER_PATH, help="Path to write visualizations")
    return p.parse_args()

if __name__ == "__main__":
    args = parse_args()
    image = args.image_name.split("/")[0]
    host = args.host_platform
    load_dotenv('/lhome/fonok/.secrets/hub_token')
    host_url = ge(f"{host}_host","")
    host_token = ge(f"{host}_token","")
    print(host_url, image)
    send_image_to_api(host_url, host_token, image)



