import datetime
import random

# 1. LISTE D'INFOS POUR L'IA (Le robot choisira au hasard)
titres = [
    "Souveraineté : Le Capitaine Ibrahim Traoré mobilise la jeunesse",
    "Transition au Faso : Vers une indépendance alimentaire totale",
    "Ibrahim Traoré : Nouvelles mesures pour la sécurité nationale",
    "Diplomatie : Le Burkina Faso renforce ses alliances stratégiques"
]

messages = [
    "Le Chef de l'État a réaffirmé que le salut du peuple réside dans le travail et l'unité nationale.",
    "La transformation des produits locaux devient la priorité absolue du gouvernement de transition.",
    "Le Capitaine Ibrahim Traoré appelle à une mobilisation générale pour la défense du territoire.",
    "De nouveaux projets industriels vont voir le jour pour booster l'économie du Burkina Faso."
]

# 2. SÉLECTION ALÉATOIRE
titre_choisi = random.choice(titres)
message_choisi = random.choice(messages)
date_du_jour = datetime.datetime.now().strftime("%d/%m/%Y à %H:%M")

# 3. MISE À JOUR DU SITE (index.html)
with open("index.html", "r", encoding="utf-8") as f:
    html = f.read()

# On crée le nouveau bloc d'article
nouvel_article = f"""
    <div class="carte">
        <span class="badge">INFO IA</span>
        <h2>{titre_choisi}</h2>
        <p>{message_choisi}</p>
        <small>Publié automatiquement le {date_du_jour}</small>
    </div>
"""

# On insère l'article au début de la zone container
page_finale = html.replace('<div class="container">', '<div class="container">' + nouvel_article)

with open("index.html", "w", encoding="utf-8") as f:
    f.write(page_finale)

print("Nouveau contenu généré avec succès !")
