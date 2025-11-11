# spaCy sample: named entity recognition
import spacy
nlp = spacy.load('en_core_web_sm')
doc = nlp('MindX AI automates nonprofit workflows.')
for ent in doc.ents:
    print(ent.text, ent.label_)
