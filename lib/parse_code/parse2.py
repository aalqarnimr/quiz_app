import requests
from bs4 import BeautifulSoup


page = requests.get("https://folderat.com/Reference/1651/%D8%A3%D8%B3%D8%A6%D9%84%D8%A9-%D8%AB%D9%82%D8%A7%D9%81%D9%8A%D8%A9")
allPages = []
soup = BeautifulSoup(page.content, 'html.parser')
pages = soup.find_all(class_='nav-link')
for link in pages:
    allPages.append(link.get('href'))
questionsAnswers = {}

for testPage in allPages:
    page = requests.get(testPage)
    soup = BeautifulSoup(page.content, 'html.parser')
    questions = soup.find_all(class_='question')
    for question in questions:
        answers = []
        questionText = question.ul.li.string
        avaliableAnswers = question.find_all('p')
        for avaliableAnswer in avaliableAnswers:
            if avaliableAnswer.strong != None:
                for correctAnswer in avaliableAnswer.strong.label.stripped_strings:
                    answers.insert(0,correctAnswer)
            elif avaliableAnswer.label !=None:
                for index,answer in enumerate(avaliableAnswer.label.stripped_strings):
                    if answer not in answers:
                        answers.append(answer)
        print(answers)
        questionsAnswers[questionText] = answers

import json

with open('data.json', 'w',encoding='utf8') as fp:
    json.dump(questionsAnswers, fp,ensure_ascii=False)
                
