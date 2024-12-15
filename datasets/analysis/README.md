# False Positive Overview

Description: a page from a language learning app showing common phrases in Spanish and their translations.

<img width=270 height=480 src = "">

Model Reasoning: The UI displays a common phrase in English ("Hello, good morning.") and provides options to translate it into Spanish using word tiles. This fits the query of showing common phrases in Spanish and their translations.

Comment: The model correctly identified that the UI contains English and Spanish in a translation context, but did not understand that in this UI, users are supposed to translate themselves instead of being shown translations. It also ignored that there is only one phrase on the screen and the description mentions multiple phrases.

<hr/>

Description: A sports team app GUI, that lists information about  schedule, news and team.

<img width=270 height=480 src = "">

Model Reasoning: The UI shown in the image includes information about the latest results, the next match, and standings, which fits the query for a sports team app GUI displaying schedule and team information. Although it does not explicitly show news, the presence of the 'more' option suggests that additional information, likely including news, could be accessed.

Comment: Here, the model itself states that parts of the UI mentioned in the description are missing, but guesses that they might be accessible through buttons in the UI. Regardless of if that guess is true (which it likely isn't, as the 'More' buttons probably point to match-specific information), this goes against the way the UI's relevance is supposed to be judged.

<hr/>

Description: The GUI from a recipe app, showing a picture and the step by step directions for the dish

<img width=270 height=480 src = "">

Model Reasoning: The UI shows a picture of the dish and includes step-by-step directions for preparing it, aligning well with the query for a recipe app interface.

Comment: The model might have been confused by the "Instructions" tab present in the UI, but they are clearly not present on the screen.

<hr/>

Description: A page from an online encyclopedia, allowing the user to search and scroll through different articles.

<img width=270 height=480 src = "">

Model Reasoning: The UI in the image shows a series of articles that a user can scroll through, which fits the query for an online encyclopedia allowing the user to search and scroll through different articles. The presence of a search bar is not explicit, but the scrolling and article presentation are relevant to the query.

Comment: The issue with this screen is that it seems to be more of a news aggregation page, not an encyclopedia. It seems that this difference was too granular for the model to understand.

<hr/>

Description: A page from a Shopping app, allowing the user buy some discounted products.

<img width=270 height=480 src = "">

Model Reasoning: The UI fits the query as it is a page from a shopping app that prominently displays discounted products. The main banner advertises discounts of up to 65% off for Valentine's Day gifts, and there are additional sections indicating discounts (e.g., 'SALE up to 75% OFF') and categories for various products.

Comment: The model correctly identified the UI as a page from a shopping app and that there are discount banners on it. However, the UI does not directly display any specific discounted products, which the model ignored.

<hr/>

Description: A page from a Shopping app, allowing the user buy some discounted products.

<img width=270 height=480 src = "">

Model Reasoning: The UI displayed is from a shopping app and it explicitly shows discounted products, which are up to 50% off. This fits the criteria of allowing the user to buy some discounted products.

Comment: The UI does look like it presents discounted products, but it actually presents upcoming sales for brands. The model did not pick up on this slight mismatch.

<hr/>

Description: An app made for navigation.

<img width=270 height=480 src = "">

Model Reasoning: The UI screen pertains to a 'Traffic Checker' feature which is relevant to navigation. Users are prompted to add home and work locations, which likely ties into route planning and navigation functionalities.

Comment: While the model correctly identified that a "Traffic Checker" App is relevant to navigation, it extrapolates that it also includes concrete navigation features, which is not definitely apparent from this UI.

<hr/>

Description: A registration GUI that requires personal information from new users and show subscribtion options.

<img width=270 height=480 src = "">

Model Reasoning: The UI shown in the image is a registration form that requires personal information from new users, such as name, email, birthday, mobile number, and zip code. It also includes an option for users to choose their preferred church and an option to receive marketing materials, which aligns with the subscription options part of the query.

Comment: In this case, the model's judgement could be argued for, because the description is vague. The annotators interpreted "subscription options" as various subscription tiers for some service, while the model deemed the option to subscribe to a mailing list as also fitting for the description.

<hr/>

Description: A page from translation app,which can translate spanish into  english.

<img width=270 height=480 src = "">

Model Reasoning: The UI shown in the image is relevant to the query. It displays a sentence in Spanish and provides a space for the user to type the English translation, which aligns with the function of translating Spanish into English.

Comment: Once again, the model correctly identified that Spanish is being translated to English in the UI, but missed that the translation is done by the user, not the app.

<hr/>

Description: This is a plattform which helps you finding the right and the next possible shops for your enquirries.

<img width=270 height=480 src = "">

Model Reasoning: The UI shown in the image is relevant to the query because it lists various stores, which aligns with the purpose of helping users find the right and next possible shops for their inquiries. The inclusion of a search bar also supports the functionality described in the query.

Comment: This is another case where the model's judgement could be argued for. The annotators assumed that the description refers to physical stores in the real world, while the model deemed online stores to be fine as well.


Description: A page from a Shopping app, allowing the user buy some discounted products.

<img width=270 height=480 src = "">

Model Reasoning: The UI clearly shows a product page from a shopping app, including details about the product, its price, and a discount offer. There is also an option to add the product to the cart, which fits the query for a shopping app page allowing the user to buy discounted products.

Comment: While there is a discount mentioned in the UI, it is not really clear if it applies to the product shown on the screen. Additionally, there is only one product shown in the UI, while the description mentions multiple products.

<hr/>

Description: A page from public transportation app,showing the wy from one place to  the other place.

<img width=270 height=480 src = "">

Model Reasoning: The UI displays a page from a public transportation app showing a route from one place to another. It provides details about departure and arrival locations, times, and directions, which aligns with the query.

Comment: The UI does seem to come from a public transportation app, but the model's claims of directions being present is not true.

<hr/>

Description: A page from a news app, where the top stories are shown.

<img width=270 height=480 src = "">

Model Reasoning: The image depicts a page from a news app that shows top stories. It includes a headline, an image, and a short description of a news story, which fits the query for a news app UI displaying top stories.

Comment: The model ignores that the UI is focused on news specific to New York, which are not necessarily the top stories.

<hr/>

Description: The GUI from a recipe app, showing a picture and the step by step directions for the dish

<img width=270 height=480 src = "">

Model Reasoning: The UI shows a recipe app interface with the name of the dish (Alfredo sauce), a picture of the dish in the background, a list of ingredients, and a section for directions for preparation. This fits the query of a recipe app showing a picture and step-by-step directions for the dish.

Comment: While the model is correct in its assessment that there is a directions section, it is not visible in the screenshot beyond its title, which the model ignores.

<hr/>

Description: The schedule app shows the upcoming matches of a sportsteam. It states the enemy team, where and when the Game will be and shows the logo of each team.

<img width=270 height=480 src = "">

Model Reasoning: The UI clearly shows the upcoming matches of a sports team, including the opposing team, the date and time of the match, and the logo of the team. This fits the query requirements.

Comment: Here, the model recognized the team logo at the top of the screen, but the description mentions the enemy team logos also being shown, which is not the case. This fine distinction was missed by the model.
