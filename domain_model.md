# User Stories to Domain Model

## Scenario

### 1.
In order to use public transport
As a customer
I want money on my card

### 2.
In order to keep using public transport
As a customer
I want to add money to my card

## Nouns in User Stories
- customer
- oystercard

## Verbs in User Stories
- balance
- add balance


##  Functional representation of that story
| Object       | Messages                   |
|------------- |----------------------------|
| customer     |                            |
| oystercard   |  balance<br> top_up        |



## How our Objects will use Messages to communicate with one another

oystercard <-- balance --> balance
oystercard <-- top_up
