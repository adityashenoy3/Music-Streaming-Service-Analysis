# SQL Music Streaming Database Project

## Overview
This project involves the creation and analysis of a database for a music streaming service, named "XStreamLee". The database design (DDL) and data manipulation (DML) queries aim to establish a robust structure and provide insightful analysis into user behavior, popular content, and service usage.

### Project Structure
- `DDL.sql`: Contains Data Definition Language queries to create the necessary tables and relationships.
- `DML.sql`: Includes Data Manipulation Language queries for data analysis.

## Database Schema
The database consists of various tables such as `Song`, `Album`, `Artist`, `Genre`, `Listener`, `Plan`, `Own`, and `Listen`, each playing a vital role in representing the music streaming service's data model.

### Tables
1. **Song**: Holds information about songs available on the platform.
2. **Album**: Contains details of albums.
3. **Artist**: Stores information about music artists.
4. **Genre**: Keeps track of different music genres.
5. **Listener**: Represents the users of the service.
6. **Plan**: Details the subscription plans available.
7. **Own**: Links listeners to their subscription plans.
8. **Listen**: Records the songs listened to by the users.

## Analysis Queries (DML)
The project includes several SQL queries for data analysis:

1. **Top 10 Most Popular Songs**: Identifies the ten most-streamed songs.
2. **Number of Listeners on Basic Plan**: Counts how many listeners are subscribed to the basic plan.
3. **Listeners Listening to Songs in Other Languages**: Calculates the percentage of listeners who prefer songs in languages different from their chosen language.
4. **Most Popular Band for Each Genre**: Determines the most popular band in each music genre.

## Installation
To use this project, clone the repository and import the `.sql` files into your SQL database management system.

```bash
git clone https://github.com/adityashenoy3/SQL-Music-Streaming-Service-Analysis.git
