import logging

logging.basicConfig(
    level=logging.DEBUG, 
    filename='app.log', 
    filemode='w', 
    format='[%(asctime)s] %(name)s - %(levelname)s - %(message)s'
)
# DEBUG 레벨 로그도 출력됨
logging.debug('This will get logged')
