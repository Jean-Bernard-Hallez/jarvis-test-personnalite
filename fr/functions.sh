# /bin/bash
AZERTYTREZA() {
# order="à"
# say "la réponse est $order";
say "$order"
}

testpersonlalite_chemin() {
testpersonlalite_chemin_etape="/home/pi/jarvis/plugins_installed/jarvis-test-personnalite/testpersonlalite_etape.txt";
testpersonlalite_chemin_tot="/home/pi/jarvis/plugins_installed/jarvis-test-personnalite/testpersonlalite_tot.txt";
testpersonlalite_chemin_noms="/home/pi/jarvis/plugins_installed/jarvis-test-personnalite/nom/";
testpersonlalite_chemin_noms_encours="/home/pi/jarvis/plugins_installed/jarvis-test-personnalite/testpersonlalite_nomencours.txt";
testpersonlalite_chemin_noms_encoursX="/home/pi/jarvis/plugins_installed/jarvis-test-personnalite/testpersonlalite_nomencoursX.txt";
}


jv_pg_testpersonlalite () {
testpersonlalite_chemin

if [ ! -d $testpersonlalite_chemin_noms ]; then
mkdir $testpersonlalite_chemin_noms
fi

if test -e $testpersonlalite_chemin_tot ; then 
testpersonlalite_addition=`cat $testpersonlalite_chemin_tot`
else
testpersonlalite_addition="0"
echo "0" > $testpersonlalite_chemin_tot
fi

if test -e "$testpersonlalite_chemin_etape"; then
testpersonlalite_compteur=`cat $testpersonlalite_chemin_etape`;
else
testpersonlalite_compteur="0";
echo "$testpersonlalite_compteur" > $testpersonlalite_chemin_etape;
fi

if [[ "$testpersonlalite_chemin_nom" == "" && "$testpersonlalite_compteur" -gt "1" ]]; then
testpersonlalite_chemin_nom=`cat $testpersonlalite_chemin_noms_encours`
say "Jarvis est relancée... vous êtes bien $testpersonlalite_chemin_nom ? dites on recommence pour repartir à zéro..."
fi

if [[ "$testpersonlalite_compteur" == "0" ]]; then 
say "Vous allez remplir une série de 10 questions."
say "Les réponses vous disent qui vous êtes maintenant et non pas qui vous étiez dans le passé."
say "répondez simplement par A, B, C exetera." 
say "Mais avant... Quel est votre prénom et votre nom ?";
testpersonlalite_boucle;
return;
fi

if [[ "$order" =~ "commence" ]]; then 
say "Ok on repart à zéro..."
testpersonlalite_reset;
jv_pg_testpersonlalite;
return;
fi


if [[ "$testpersonlalite_compteur" == "1" ]]; then 
testpersonlalite_chemin_nom=`echo "$order" | sed -e "s/c'est//g" | sed -e "s/mon//g" | sed -e "s/nom//g" | sed -e "s/est//g"`
testpersonlalite_chemin_nom1=`echo "$testpersonlalite_chemin_nom" | sed -e "s/ /_/g"`
say "Ok $testpersonlalite_chemin_nom,"
echo "$testpersonlalite_chemin_nom" > $testpersonlalite_chemin_noms$testpersonlalite_chemin_nom1.txt
echo "$testpersonlalite_chemin_nom" > $testpersonlalite_chemin_noms_encours
testpersonlalite_boucle;
jv_pg_testpersonlalite;
return;
fi

# echo "---testpersonlalite_addition=$testpersonlalite_addition---ordr=$order---$estpersonlalite_compteur---testpersonlalite_chemin_nom=$testpersonlalite_chemin_nom---"

if [[ "$testpersonlalite_compteur" == "2" ]]; then 
say "Question 1. Quand vous sentez vous le mieux:";
say "A. le matin,";
say "B. dans la journée et en début de soirée,";
say "C. tard le soir.";
testpersonlalite_boucle;
return;
fi

if [[ "$testpersonlalite_compteur" == "3" ]]; then 
testpersonlalite_reponse="2, 4, 6";
testpersonlalite_reponse_resultat;
say "Question 2. Vous avez une démarche:";
say "A. plutôt rapide avec de longues enjambées,";
say "B. plutôt rapide avec de petites enjambées rapides, ";
say "C. moins rapide, la tête haute, regardant le monde dans les yeux";
say "D. moins rapide, la tête baissée,";
say "E. très lente.";
testpersonlalite_boucle;
return;
fi

if [[ "$testpersonlalite_compteur" == "4" ]]; then 
testpersonlalite_reponse="6, 4, 7, 2, 1";
testpersonlalite_reponse_resultat;
say "Question 3. Lorsque vous parlez à quelqu'un, vous avez:";
say "A. les bras croisés, ";
say "B. les mains jointes,";
say "C. une main ou les deux sur les hanches," ;
say "D. touchez ou poussez la personne à qui vous parlez,";
say "e. jouez avec votre oreille, touchez votre menton ou vous caressez les cheveux.";
testpersonlalite_boucle;
return;
fi

if [[ "$testpersonlalite_compteur" == "5" ]]; then 
testpersonlalite_reponse="4, 2, 5, 7, 6";
testpersonlalite_reponse_resultat;
say "Question 4. Lorsque vous vous relaxez, vous êtes assis avec:";
say "A. les genoux serrés avec les jambes l'une à côté de l'autre,";
say "B. les jambes croisées,";
say "C. les jambes étendues ou raides,";
say "D. une jambe croisée sous vous.";
testpersonlalite_boucle;
return;
fi

if [[ "$testpersonlalite_compteur" == "6" ]]; then 
testpersonlalite_reponse="4, 6, 2, 1";
testpersonlalite_reponse_resultat;
say "Question 5. Lorsque quelquechose vous amuse vraiment, vous réagissez par :";
say "A. un grand éclat de rire, ";
say "B. un éclat de rire mais pas bruyant,";
say "C. un rire discret,";
say "D. un petit sourire.";
testpersonlalite_boucle;
return;
fi


if [[ "$testpersonlalite_compteur" == "7" ]]; then 
testpersonlalite_reponse="6, 4,	3, 5, 2";
testpersonlalite_reponse_resultat;
say "Question 6. Lorsque vous allez à une soirée ou une réunion vous:";
say "A. faites une entrée bruyante pour que tout le monde vous remarque,";
say "B. faites une entrée discrète, en regardant autour de vous pour trouver quelqu'un que vous connaissez,";
say "C. faites une entrée des plus discrètes, en essayant de passe inaperçu.";
testpersonlalite_boucle;
return;
fi

if [[ "$testpersonlalite_compteur" == "8" ]]; then 
testpersonlalite_reponse="6, 4, 2";
testpersonlalite_reponse_resultat;
say "Question 7. Vous travaillez très dur, vous êtes très concentré, et vous êtes interrompu. Vous:";
say "A. accueillez la pause avec plaisir, ";
say "B. êtes extrêmement irrité,";
say "C. hésitez entre ces deux extrêmes.";
testpersonlalite_boucle;
return;
fi

if [[ "$testpersonlalite_compteur" == "9" ]]; then 
testpersonlalite_reponse="6, 2, 4";
testpersonlalite_reponse_resultat;
say "Question 8. Laquelle de ces couleurs préférez-vous ?";
say "A. rouge ou orange,";
say "B. noir, C. jaune ou bleu clair,";
say "D. vert, ";
say "E. bleu foncé ou violet,";
say "F. blanc,";
say "G. marron ou gris.";
testpersonlalite_boucle;
return;
fi

if [[ "$testpersonlalite_compteur" == "10" ]]; then 
testpersonlalite_reponse="6, 7, 5, 4, 3, 2, 1";
testpersonlalite_reponse_resultat;
say "Question 9. Lorsque vous êtes au lit la nuit, dans les derniers instants avant de vous endormir, vous êtes étendu:";
say "A. étendu sur le dos,";
say "B. étendu sur le ventre,";
say "C. sur votre côté favori, légèrement recroquevillé,";
say "D. avec un bras sous votre tête,";
say "E. avec votre tête sous les couvertures.";
testpersonlalite_boucle;
return;
fi

if [[ "$testpersonlalite_compteur" == "11" ]]; then 
testpersonlalite_reponse="7, 6, 4, 2, 1";
testpersonlalite_reponse_resultat;
say "Question 10. Vous rêvez souvent que vous:";
say "A. êtes en train de tomber,";
say "B. êtes en train de vous battre ou de lutter,";
say "C. êtes en train de chercher quelquechose ou quelqu'un,"
say "D. êtes en train de voler ou de flotter,";
say "E. généralement vous avez un sommeil sans rêves,"
say "F. vos rêves sont toujours agréables.";
testpersonlalite_boucle;
return;
fi

if [[ "$testpersonlalite_compteur" == "12" ]]; then 
testpersonlalite_reponse="4, 2, 3, 5, 6, 1";
testpersonlalite_boucle;
testpersonlalite_reponse_resultat;
fi

if [[ "$testpersonlalite_compteur" == "13" ]]; then 
say "Voilà on y est, voici votre résultat:";
testpersonlalite_reponse_resultat_final;
say "Voilà $testpersonlalite_chemin_nom, Bonne continuation...";
testpersonlalite_reset;
return;
fi
}

testpersonlalite_boucle() {
testpersonlalite_compteur=`cat $testpersonlalite_chemin_etape`
testpersonlalite_compteur=$(( $testpersonlalite_compteur + 1 ));
echo "$testpersonlalite_compteur" > $testpersonlalite_chemin_etape;
# echo "compteur=$testpersonlalite_compteur"
}
testpersonlalite_reponse_resultat() {
testpersonlalite_addition=`cat $testpersonlalite_chemin_tot`
order=`echo $order | sed -e "s/à/a/g" | sed -e "s/réponse//g" | sed -e "s/numéro//g"  | sed -e "s/est//g"`

if [[ "$order" =~ "répèt" ]]; then testpersonlalite_compteur=$(( $testpersonlalite_compteur - 1 )); echo $testpersonlalite_compteur > $testpersonlalite_chemin_etape; return; fi
if [[ "$order" =~ "a" ]]; then testpersonlalitetest_valeur=`echo "$testpersonlalite_reponse" | cut -d" " -f1 | sed -e "s/,//g"`; fi
if [[ "$order" =~ "b" ]]; then testpersonlalitetest_valeur=`echo "$testpersonlalite_reponse" | cut -d" " -f2 | sed -e "s/,//g"`; fi
if [[ "$order" =~ "c" ]]; then testpersonlalitetest_valeur=`echo "$testpersonlalite_reponse" | cut -d" " -f3 | sed -e "s/,//g"`; fi
if [[ "$order" =~ "d" ]]; then testpersonlalitetest_valeur=`echo "$testpersonlalite_reponse" | cut -d" " -f4 | sed -e "s/,//g"`; fi
if [[ "$order" =~ "e" ]]; then testpersonlalitetest_valeur=`echo "$testpersonlalite_reponse" | cut -d" " -f5 | sed -e "s/,//g"`; fi
if [[ "$order" =~ "f" ]]; then testpersonlalitetest_valeur=`echo "$testpersonlalite_reponse" | cut -d" " -f6 | sed -e "s/,//g"`; fi
if [[ "$order" =~ "g" ]]; then testpersonlalitetest_valeur=`echo "$testpersonlalite_reponse" | cut -d" " -f7 | sed -e "s/,//g"`; fi

if [[ "$testpersonlalitetest_valeur" != "" ]]; then
testpersonlalite_addition=$(( $testpersonlalite_addition +  `echo "$testpersonlalite_reponse" | cut -d" " -f1 | sed -e "s/,//g"` ));
echo "$testpersonlalite_addition" > $testpersonlalite_chemin_tot

else
say "Veuillez prononcer l'une des lettres de l'aphabet..."
testpersonlalite_compteur=$(( $testpersonlalite_compteur - 1 )); 
echo $testpersonlalite_compteur > $testpersonlalite_chemin_etape;
order=""
return;
fi

}

testpersonlalite_reponse_resultat_final(){
echo "Point total = $testpersonlalite_addition"
echo "Point total = $testpersonlalite_addition" >> $testpersonlalite_chemin_noms$testpersonlalite_chemin_nom1.txt

if [[ "$testpersonlalite_addition" -gt "60" ]]; then
say "Les autres vous voient comme quelqu'un qu'ils doivent prendre avec précaution. "; 
say "Vous êtes perçu comme quelqu'un de vaniteux, égocentrique, et extrêmement autoritaire."; 
say "Les autres peuvent vous admirer, en espérant vous ressembler, mais ne vous font pas toujours confiance, hésitant à trop s'investir avec vous."; 
fi

# * De 51 à 60 points :
if [[ "$testpersonlalite_addition" -ge "51" && "$testpersonlalite_addition" -le "60" ]]; then
say "Les autres vous perçoivent comme quelqu'un de motivant, de très volatile, plutôt impulsif, un leader naturel, rapide pour prendre des décisions,";
say "même si ce ne sont pas toujours les bonnes.";
say "Ils vous voient comme étant audacieux et aventureux, quelqu'un qui essaie tout au moins une fois, quelqu'un qui tente sa chance et aime l'aventure.";
say "Ils apprécient être en votre compagnie pour l'intérêt que vous suscitez autour de vous.";
fi

# * 41 à 50 points :
if [[ "$testpersonlalite_addition" -ge "41" && "$testpersonlalite_addition" -le "50" ]]; then
say "Les autres vous perçoivent comme étant plein d'entrain, vivant, charmant, amusant, pratique et toujours interessé.";
say "Quelqu'un qui est constamment au centre de l'attention, mais suffisemment équilibré pour que ça ne lui monte pas à la tête.";
say "Ils vous voient également comme étant quelqu'un de gentil, courtois et compréhensif ; quelqu'un qui est toujours prêt à leur remonter le moral et à les aider.";
fi

# * De 31 à 40 points :
if [[ "$testpersonlalite_addition" -ge "31" && "$testpersonlalite_addition" -le "40" ]]; then
say "Les autres vous perçoivent comme quelqu'un de raisonnable, attentionné, soigneux et pratique.";
say "Ils vous voient comme étant intelligent, généreux, doué, mais modeste ... ";
say "Pas quelqu'un qui se fait des amis trop vite ou trop facilement,";
say "mais quelqu'un d'extrêmement loyal envers les amis qu'il se fait et qui en attendent de même en retour.";
say "Ceux qui ont la chance de réellement vous connaître se rendent compte qu'il est difficile de chambouler la confiance que vous leur faites,";
say "mais aussi qu'il faudra beaucoup de temps pour retrouver cette confiance si elle était trahie.";
fi

# * De 21 à 30 points :
if [[ "$testpersonlalite_addition" -ge "21" && "$testpersonlalite_addition" -le "30" ]]; then
say "Vos amis vous perçoivent comme quelqu'un de minutieux, un peu maniaque.";
say "Ils vous voient comme quelqu'un de méticuleux et très prudent, régulier et bosseur.";
say "Ils seraient très surpris de vous voir faire quelque chose d'impulsif ou sur un coup de tête,";
say "s'attendant à ce que vous examiniez soigneusement chaque chose sous tous les angles avant de prendre une décision.";
say "Ils pensent que cette attitude est due en partie à votre nature prudente.";
fi

if [[ "$testpersonlalite_addition" -le "21" ]]; then
say "Les gens vous trouvent timide, nerveux et indécis, quelqu'un qui a toujours besoin d'attention,";
say "qui a toujours besoin de quelqu'un pour prendre les décisions et qui ne veut s'investir dans rien et avec personne.";
say "Ils vous voient comme quelqu'un d'angoissé qui voient des problèmes partout même là où il n'y en a pas. Certaines personnes vous trouvent même ennuyeuse." ;
say "Seuls ceux qui vous connaissent vraiment savent que vous ne l'êtes pas.";
fi

if [ -z $testpersonlalite_chemin_noms_encours ]; then
testpersonlalite_chemin_nom=`cat $testpersonlalite_chemin_noms_encours`;
fi
GOTOSORTIPESRONNALITE="FIN";
return;
}

testpersonlalite_reset() {
testpersonlalite_chemin
testpersonlalite_addition=""
testpersonlalite_compteur=""

if test -e $testpersonlalite_chemin_etape; then
sudo rm $testpersonlalite_chemin_etape
fi

if test -e  $testpersonlalite_chemin_tot; then
sudo rm $testpersonlalite_chemin_tot
fi

if test -e $testpersonlalite_chemin_noms_encours; then
sudo rm $testpersonlalite_chemin_noms_encours
fi

if test -e $testpersonlalite_chemin_noms_encoursX; then
sudo rm $testpersonlalite_chemin_noms_encoursX
fi
}

jv_pg_testpersonlalite_rappel() {
testpersonlalite_chemin
testpersonlalite_rappel_recherche=`echo "$1_$2_$3" | sed "s/.$//"`;
echo "1-------"
jv_pg_testpersonlalite_rappel_suite;

if [[ `echo $testpersonlalite_rappel_recherche_ilya | grep " " | wc -w` == "0" ]]; then
testpersonlalite_rappel_recherche="$1_$2";
echo "2-------"
jv_pg_testpersonlalite_rappel_suite;
fi

if [[ `echo $testpersonlalite_rappel_recherche_ilya | grep " " | wc -w` == "0" ]]; then
testpersonlalite_rappel_recherche="$1";
echo "3-------"
jv_pg_testpersonlalite_rappel_suite;
fi

if [[ `echo $testpersonlalite_rappel_recherche_ilya | grep " " | wc -w` == "1" ]]; then
echo "4-------"
testpersonlalite_rappel_recherche_ilya1=`cat $testpersonlalite_rappel_recherche_ilya |sed -n 1p`
say "J'ai trouvé $testpersonlalite_rappel_recherche_ilya1 ?"
testpersonlalite_reponse_resultat_final;
GOTOSORTIPESRONNALITE="FIN"
return;
fi

if [[ `echo $testpersonlalite_rappel_recherche_ilya | grep " " | wc -w` -gt "1" ]]; then
echo "5-------"
say "il y a plusieurs nom similaire veuillez préciser car j'ai "
echo "$testpersonlalite_rappel_recherche_ilya" > $testpersonlalite_chemin_noms_encoursX

testpersonlalite_rappel_recherche_ilya=`cat $testpersonlalite_chemin_noms_encoursX | sed -e "s/.txt//g" | sed -e "s/_/ /g" | sed -n 1p`
if [[ "$testpersonlalite_rappel_recherche_ilya" != "" ]]; then echo "A: $testpersonlalite_rappel_recherche_ilya"; fi
testpersonlalite_rappel_recherche_ilya=`cat $testpersonlalite_chemin_noms_encoursX | sed -e "s/.txt//g" | sed -e "s/_/ /g" | sed -n 2p`
if [[ "$testpersonlalite_rappel_recherche_ilya" != "" ]]; then echo "B: $testpersonlalite_rappel_recherche_ilya"; fi
testpersonlalite_rappel_recherche_ilya=`cat $testpersonlalite_chemin_noms_encoursX | sed -e "s/.txt//g" | sed -e "s/_/ /g" | sed -n 3p`
if [[ "$testpersonlalite_rappel_recherche_ilya" != "" ]]; then echo "C: $testpersonlalite_rappel_recherche_ilya"; fi
testpersonlalite_rappel_recherche_ilya=`cat $testpersonlalite_chemin_noms_encoursX | sed -e "s/.txt//g" | sed -e "s/_/ /g" | sed -n 4p`
if [[ "$testpersonlalite_rappel_recherche_ilya" != "" ]]; then echo "D: $testpersonlalite_rappel_recherche_ilya"; fi
testpersonlalite_rappel_recherche_ilya=`cat $testpersonlalite_chemin_noms_encoursX | sed -e "s/.txt//g" | sed -e "s/_/ /g" | sed -n 5p`
if [[ "$testpersonlalite_rappel_recherche_ilya" != "" ]]; then echo "E: $testpersonlalite_rappel_recherche_ilya"; fi
return; 
fi

echo "6-------"
testpersonlalite_addition=`cat $testpersonlalite_rappel_recherche_ilya | sed -n 2p | sed -e "s/Point total = //g"`
# say "Avec ses $testpersonlalite_chemin_tot points il a obtenu:"

GOTOSORTIPESRONNALITE="FIN"
}

jv_pg_testpersonlalite_rappel_suite() {
testpersonlalite_chemin_noms="/home/pi/jarvis/plugins_installed/jarvis-test-personnalite/nom/";
testpersonlalite_rappel_recherche_ilya=`find $testpersonlalite_chemin_noms -name "$testpersonlalite_rappel_recherche*.txt" | sed -e "s/\/.*\///g"`
# echo "$testpersonlalite_rappel_recherche_ilya"
}

jv_pg_testpersonlalite_rappel_suite_A() {
testpersonlalite_chemin_noms="/home/pi/jarvis/plugins_installed/jarvis-test-personnalite/nom/";
testpersonlalite_chemin_noms_encoursX="/home/pi/jarvis/plugins_installed/jarvis-test-personnalite/testpersonlalite_nomencoursX.txt";
order=`echo $order | sed -e "s/à/a/g" | sed -e "s/réponse//g" | sed -e "s/numéro//g"  | sed -e "s/est//g"`

if [[ "$order" =~ "a" ]]; then 
testpersonlalite_rappel_recherche_ilya=`cat $testpersonlalite_chemin_noms_encoursX | sed -n 1p`
fi

if [[ "$order" =~ "b" ]]; then 
testpersonlalite_rappel_recherche_ilya=`cat $testpersonlalite_chemin_noms_encoursX | sed -n 2p`
fi

if [[ "$order" =~ "c" ]]; then 
testpersonlalite_rappel_recherche_ilya=`cat $testpersonlalite_chemin_noms_encoursX | sed -n 3p`
fi

if [[ "$order" =~ "d" ]]; then 
testpersonlalite_rappel_recherche_ilya=`cat $testpersonlalite_chemin_noms_encoursX | sed -n 4p`
fi

if [[ "$order" =~ "e" ]]; then 
testpersonlalite_rappel_recherche_ilya=`cat $testpersonlalite_chemin_noms_encoursX | sed -n 5p`
fi

testpersonlalite_addition=`cat $testpersonlalite_chemin_noms/$testpersonlalite_rappel_recherche_ilya | sed -n 2p | sed -e "s/Point total = //g"`
say "Résultat avec:"
testpersonlalite_reponse_resultat_final;
GOTOSORTIPESRONNALITE="FIN"
return; 
}

jv_pg_testpersonlalite_qui() {
testpersonlalite_chemin
testpersonlalite_rappel_recherche_ilya=`find $testpersonlalite_chemin_noms -name "*.txt"`
testpersonlalite_rappel_recherche_ilya_total=`ls /home/pi/jarvis/plugins_installed/jarvis-test-personnalite/nom/ | wc -l`
say "il y a $testpersonlalite_rappel_recherche_ilya_total qui ont passé le test:"
testpersonlalite_rappel_recherche_ilya_tot="1"
echo "" > $testpersonlalite_chemin_noms_encoursX
jv_pg_testpersonlalite_qui_suite
}

jv_pg_testpersonlalite_qui_suite() {
if [[ "$testpersonlalite_rappel_recherche_ilya_tot" -le  "$testpersonlalite_rappel_recherche_ilya_total" ]]; then 
adire_cat_testpersonlalite=$(cat `find $testpersonlalite_chemin_noms -name "*.txt" | sed -n $testpersonlalite_rappel_recherche_ilya_tot\p` | sed -n 1p)
adire_cat_testpersonlalite_cat=`echo $testpersonlalite_chemin_noms -name "*.txt" | sed -n $testpersonlalite_rappel_recherche_ilya_tot\p`
# echo "$testpersonlalite_rappel_recherche_ilya_tot $adire_cat_testpersonlalite_cat, " >> $testpersonlalite_chemin_noms_encoursX
echo "$testpersonlalite_rappel_recherche_ilya_tot $(find $testpersonlalite_chemin_noms -name "*.txt" | sed -n $testpersonlalite_rappel_recherche_ilya_tot\p)" >> $testpersonlalite_chemin_noms_encoursX

say "$testpersonlalite_rappel_recherche_ilya_tot: $adire_cat_testpersonlalite" 
testpersonlalite_rappel_recherche_ilya_tot=$(( $testpersonlalite_rappel_recherche_ilya_tot + 1 ))
jv_pg_testpersonlalite_qui_suite
fi
}

jv_pg_testpersonlalite_efface() {
testpersonlalite_chemin
testpersonlalite_rappel_recherche_ilya=`find $testpersonlalite_chemin_noms -name "*.txt"`
testpersonlalite_rappel_recherche_ilya_total=`ls /home/pi/jarvis/plugins_installed/jarvis-test-personnalite/nom/ | wc -l`
say "Qui voulez vous effacer parmit les $testpersonlalite_rappel_recherche_ilya_total qui ont passé le test:"
testpersonlalite_rappel_recherche_ilya_tot="1"
jv_pg_testpersonlalite_qui_suite
say "ou tout le répertoire ?"

}

jv_pg_testpersonlalite_efface_suite() {
testpersonlalite_chemin
if [[ "$order" =~ "tou" ]]; then 
sudo rm `echo $testpersonlalite_chemin_noms*.txt`
say "Voilà... Le répetoire est vide..."
return
fi

testpersonlalite_corrigeorder
sudo rm `cat $testpersonlalite_chemin_noms_encoursX | grep "$order" | cut -d" " -f2 | sed -n 1p`
say "Voilà...c'est supprimé"
}

testpersonlalite_corrigeorder() {

if [[ "$order" =~ "un" ]]; then order="1"; fi
if [[ "$order" =~ "deux" ]]; then order="2"; fi
if [[ "$order" =~ "trois" ]]; then order="3"; fi
if [[ "$order" =~ "quatre" ]]; then order="4"; fi
if [[ "$order" =~ "cinq" ]]; then order="5"; fi
if [[ "$order" =~ "six" ]]; then order="6"; fi
if [[ "$order" =~ "sept" ]]; then order="7"; fi
if [[ "$order" =~ "huit" ]]; then order="8"; fi
if [[ "$order" =~ "neuf" ]]; then order="9"; fi
}

