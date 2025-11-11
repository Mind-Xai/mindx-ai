# Hugging Face Transformers sample: sentiment analysis
from transformers import pipeline

classifier = pipeline('sentiment-analysis')
result = classifier('MindX AI is changing the world!')
print(result)
