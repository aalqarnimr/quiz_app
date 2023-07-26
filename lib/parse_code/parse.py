from bs4 import BeautifulSoup
import requests;

page = requests.get('https://mawdoo3.com/%D8%A3%D8%B3%D8%A6%D9%84%D8%A9_%D8%B9%D8%A7%D9%85%D8%A9_%D8%B3%D9%87%D9%84%D8%A9_%D9%85%D8%B9_%D8%AE%D9%8A%D8%A7%D8%B1%D8%A7%D8%AA')
#print(page.text)

questionAnswers = {}

soup = BeautifulSoup(page.text, 'html.parser')
first_level = soup.find_all('li')
questionsList = []
result = soup.find_all('span','ql-ui')
for element in result:
    if (element.next_sibling.name == 'strong'):
        questionsList.append(element.parent)
print(questionsList)
for question in questionsList:
    #print(question.parent.next_sibling.strings[1])
    quesionTitle = question.strong.string
    questionChoices = []
    for choice in question.ul.stripped_strings:
        questionChoices.append(choice)
    
    for index,correctAnswer in enumerate(question.parent.next_sibling.stripped_strings):
        if index == 1:
            if correctAnswer in questionChoices:
                questionChoices.insert(0, questionChoices.pop(questionChoices.index(correctAnswer)))
                questionAnswers[quesionTitle] = questionChoices

import json

with open('data.json', 'w',encoding='utf8') as fp:
    json.dump(questionAnswers, fp,ensure_ascii=False)
    

            
    