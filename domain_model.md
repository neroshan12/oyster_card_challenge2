# User Stories to Domain Model

## Scenario

### 1.
In order to use public transport
As a customer
I want money on my card


## Nouns in User Stories
- customer
- oystercard

## Verbs in User Stories
- balance


##  Functional representation of that story
| Object       | Messages                   |
|------------- |----------------------------|
| customer     |                            |
| oystercard   |  balance                   |



## How our Objects will use Messages to communicate with one another

oystercard <-- balance --> balance
