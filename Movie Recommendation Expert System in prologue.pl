% Check if X is an element of List
elem(X,[X|_]).
elem(X,[_|Tail]) :- elem(X,Tail).

%Check whether lists have a common element
elems(X,[Y|_]) :- elem(Y,X).
elems(X,[_|Tail]) :- elems(X,Tail).

list_movie(Actor,Categories,Min,Max,Stream,Theme,L) :-
    list_movie(Actor,Categories,Min,Max,Stream,Theme, [], L).

list_movie(Actor,Categories,Min,Max,Stream,Theme, Acc, L) :-
    movie(Movie,Actor,Category,Length,Streamings,Themes),
    elems(Theme,Themes),
    elem(Stream,Streamings),
    elem(Category,Categories),
    Length > Min-1,
    Length < Max+1,
    \+ elem(Movie, Acc), !,
    list_movie(Actor,Categories,Min,Max,Stream,Theme,[Movie|Acc], L).

list_movie(_,_,_,_,_,_, L, L).

suggest_movie(M) :-
    write('Type your age: '),
    read(Age),
    get_category(Age, Categories),
    write('Choose movie context: \n   family-friendly   adventure   learning   thrills-chills	mood-boosting      animation\n'),
    read(Context),
    write('Choose movie language: \n   english   urdu   hindi\n'),
    read(Language),
    (   Language == 'english'
    ->  write('Choose an actor from: \n    ryan_gosling   mike_myers   mark_hamill   chris_hemsworth\n    harrison_ford   daniel_radcliffe   tom_hanks   leonardo_dicaprio\n    keanu_reeves   matt_damon   matthew_mcconaughey   henry_cavill\n   albert_brooks	jack_black   mandy_moore   elijah_wood\n   emma_watson   dwayne_johnson   jennifer_lawrence\n...\n'),
    read(Actor)
    ;   Language == 'hindi'
    ->  write('Choose an actor from: \n	aamir_khan    dilip_kumar	amitabh_bachchan    akshay_kumar\n    salman_khan    hrithik_roshan   irrfan_khan	shah_rukh_khan\n    deepika_padukone	ranbir_kapoor	kajol_devgan    sanjay_dutt\n	ajay_devgn     alia_bhatt    priyanka_chopra     juhi_chawla...\n'),
    read(Actor)
    ;   write('Choose an actor from: \n	javaid_sheikh	mahira_khan    humayun_saeed    mehwish_hayat\n	danish_taimoor   maya_ali	ahmed_ali_butt\n...\n'),
    read(Actor)
    ),
    write('Choose your streaming platform: \n   netflix   hbogo   prime   disney:\n'),
    read(Stream),
    write('Type minimum length of film in minutes(50-90): '),
    read(Min),
    write('Type maximum length of film in minutes(100-200): '),
    read(Max),
    get_theme(Context,Theme),
    list_movie(Actor,Categories,Min,Max,Stream,Theme,M).

% Get categories from user's age
get_category(Age, X) :- Age < 10, X = [g].
get_category(Age, X) :- Age > 9, Age < 15, X = [g,pg].
get_category(Age, X) :- Age > 14, Age < 20, X = [g,pg,pg13].
get_category(Age, X) :- Age > 19, Age < 25, X = [g,pg,pg13,r].
get_category(Age, X) :- Age > 24, X = [g,pg,pg13,r,nc17].

% Get themes from user's mood
get_theme(Context, X) :-
    Context = family-friendly,
    X = [family,comedy,action,sci-fi,animation,fantasy,musical].

get_theme(Context, X) :-
    Context = adventure,
    X = [mystery,fantasy,musical,adventure,sport].

get_theme(Context, X) :-
    Context = learning,
    X = [biography,history,sci-fi,musical,comedy,sport,mystery].

get_theme(Context, X) :-
    Context = thrills-chills,
    X = [horror,sci-fi,drama,mystery,biography,thriller,war,crime].

get_theme(Context, X) :-
    Context = mood-boosting,
    X = [comedy,romance,fantasy,action,drama,mystery].

get_theme(Context, X) :-
    Context = animation,
    X = [animation].

%DATABAE_OF_HOLLYWOOD_MOVIES
movie(blade_runner_2049,ryan_gosling,r,164,[netflix],[action,drama,mystery,sci-fi,thriller]).
movie(la_la_land,ryan_gosling,pg13,128,[netflix],[comedy,drama,music,romance]).
movie(the_big_short,ryan_gosling,r,130,[netflix],[biography,comedy,drama]).
movie(the_nice_guys,ryan_gosling,r,116,[netflix],[action,comedy,crime,mystery]).
movie(driver,ryan_gosling,r,100,[netflix],[action,crime,drama,thriller]).
movie(blue_valentine,ryan_gosling,r,112,[prime],[drama,romance]).
movie(crazy_stupid_love,ryan_gosling,pg13,118,[netflix],[comedy,drama,romance]).
movie(gangster_squad,ryan_gosling,r,113,[netflix],[action,crime,drama,thriller]).
movie(lars_and_the_real_girl,ryan_gosling,pg13,106,[netflix],[comedy,drama,romance]).
movie(half_nelson,ryan_gosling,r,106,[prime],[drama]).
movie(the_place_beyond_the_pines,ryan_gosling,r,140,[netflix],[crime,drama,thriller]).
movie(fracture,ryan_gosling,r,113,[prime],[crime,drama,mystery,thriller]).
movie(only_god_forgives,ryan_gosling,r,90,[netflix],[crime,drama,thriller]).
movie(the_ides_of_march,ryan_gosling,r,101,[prime],[drama,thriller]).
movie(the_believer,ryan_gosling,r,98,[prime],[drama]).
movie(stay,ryan_gosling,r,99,[netflix],[drama,mystery,thriller]).
movie(all_good_things,ryan_gosling,r,101,[prime],[crime,drama,mystery,romance,thriller]).
movie(murder_by_numbers,ryan_gosling,r,120,[netflix],[crime,drama,thriller]).
movie(song_to_song,ryan_gosling,r,129,[prime],[drama,music,romance]).
movie(first_man,ryan_gosling,pg13,141,[netflix],[biography,drama,history]).
movie(united_states_of_leland,ryan_gosling,r,108,[prime],[crime,drama]).
movie(the_slapper,ryan_gosling,r,120,[prime],[action,comedy]).
movie(the_driver_2,ryan_gosling,r,112,[netflix],[action,crime,drama,thriller]).
movie(battle_of_the_sexists,ryan_gosling,pg13,100,[netflix],[comedy,drama,sport]).
movie(under_the_silver_lake,ryan_gosling,r,139,[prime],[crime,drama,mystery]).

movie(shrek,mike_myers,pg,90,[netflix,prime],[animation,adventure,comedy,family,fantasy]).
movie(austin_powers:international_man_of_mystery,mike_myers,pg13,94,[netflix],[action,adventure,comedy,crime]).
movie(the_cat_in_the_hat,mike_myers,pg,82,[netflix],[adventure,comedy,family,fantasy]).
movie(the_love_guru,mike_myers,pg13,87,[netflix],[comedy,romance,sport]).
movie(so_i_married_an_axe_murderer,mike_myers,pg13,93,[prime],[comedy,crime,romance]).
movie(austin_powers:the_spy_who_shagged_me,mike_myers,pg13,95,[netflix],[action,adventure,comedy]).
movie(austin_powers_in_goldmember,mike_myers,pg13,94,[netflix],[action,adventure,comedy]).
movie(shrek_2,mike_myers,pg,93,[netflix],[animation,adventure,comedy,family,fantasy]).
movie(shrek_the_third,mike_myers,pg,93,[netflix],[animation,adventure,comedy,family,fantasy]).
movie(shrek_forever_after,mike_myers,pg,93,[netflix],[animation,adventure,comedy,family,fantasy]).
movie(waynes_world,mike_myers,pg13,94,[prime],[comedy,music]).
movie(waynes_world_2,mike_myers,pg13,95,[prime],[comedy,music]).
movie(54,mike_myers,r,93,[prime],[drama,music]).
movie(mystery_alaska,mike_myers,r,119,[netflix],[comedy,drama,sport]).
movie(view_from_the_top,mike_myers,pg13,87,[prime],[comedy,romance]).
movie(the_gong_show_movie,mike_myers,r,89,[netflix],[comedy,music]).
movie(bedazzled,mike_myers,pg13,93,[prime],[comedy,fantasy,romance]).
movie(saturday_night_live:mike_myers_special,mike_myers,pg13,89,[prime],[comedy]).
movie(terminal_impact,mike_myers,r,106,[prime],[action,thriller]).
movie(the_pentaverate,mike_myers,pg13,99,[netflix],[comedy,mystery]).
movie(supermensch_the_legend_of_shep_gordon,mike_myers,r,84,[prime],[documentary]).
movie(austin_powers_4,mike_myers,pg13,96,[netflix],[action,adventure,comedy]).
movie(bombshell,mike_myers,r,108,[hbogo],[biography,drama]).
movie(the_gong_show,mike_myers,pg13,120,[netflix],[comedy,drama,music]).
movie(baby_spice,mike_myers,pg13,95,[prime],[comedy,romance]).

movie(thor_ragnarok,chris_hemsworth,pg13,130,[disney],[action,adventure,comedy,fantasy,sci-fi]).
movie(avengers:endgame,chris_hemsworth,pg13,181,[disney],[action,adventure,sci-fi]).
movie(men_in_black:international,chris_hemsworth,pg13,114,[netflix],[action,adventure,comedy,sci-fi]).
movie(snow_white_and_the_huntsman,chris_hemsworth,pg13,127,[prime],[action,adventure,drama,fantasy]).
movie(rush,chris_hemsworth,r,123,[hbogo],[biography,drama,sport]).
movie(the_cabin_in_the_woods,chris_hemsworth,r,95,[netflix],[horror,thriller]).
movie(blackhat,chris_hemsworth,r,133,[prime],[action,crime,drama,thriller]).
movie(in_the_heart_of_the_sea,chris_hemsworth,pg13,122,[disney],[action,adventure,biography,drama]).
movie(reboot_camp,chris_hemsworth,r,96,[prime],[comedy]).
movie(_12_strong,chris_hemsworth,r,130,[hbogo],[action,drama,history,war]).
movie(a_perfect_getaway,chris_hemsworth,r,98,[netflix],[adventure,mystery,thriller]).
movie(the_huntsman_winters_war,chris_hemsworth,pg13,114,[prime],[action,adventure,drama,fantasy]).
movie(red_dawn,chris_hemsworth,pg13,93,[hbogo],[action,thriller]).
movie(rush_hour,chris_hemsworth,pg13,118,[prime],[action,comedy,crime]).
movie(bad_times_at_the_el_royale,chris_hemsworth,r,141,[netflix],[crime,drama,mystery,thriller]).
movie(the_avengers,chris_hemsworth,pg13,143,[disney],[action,adventure,sci-fi]).
movie(thor,chris_hemsworth,pg13,115,[disney],[action,adventure,drama,fantasy]).
movie(thor_the_dark_world,chris_hemsworth,pg13,112,[disney],[action,adventure,drama,fantasy]).
movie(thor_love_and_thunder,chris_hemsworth,pg13,119,[disney],[action,adventure,comedy,fantasy]).
movie(extraction,chris_hemsworth,r,117,[netflix],[action,thriller]).
movie(the_red_sea_diving_resort,chris_hemsworth,pg13,130,[netflix],[drama,history,thriller]).
movie(spiderhead,chris_hemsworth,r,107,[netflix],[drama,sci-fi,thriller]).
movie(jay_and_silent_bob_reboot,chris_hemsworth,r,105,[prime],[comedy]).
movie(detroit,chris_hemsworth,r,143,[prime],[crime,drama,history,thriller]).
movie(limited_partners,chris_hemsworth,r,106,[netflix],[comedy,drama]).

movie(star_wars_episode_IV:a_new_hope,mark_hamill,pg,121,[disney],[action,adventure,fantasy,sci-fi]).
movie(star_wars_episode_V:the_empire_strikes_back,mark_hamill,pg,124,[disney],[action,adventure,fantasy,sci-fi]).
movie(star_wars_episode_VI:return_of_the_jedi,mark_hamill,pg,131,[disney],[action,adventure,fantasy,sci-fi]).
movie(batman_the_animated_series,mark_hamill,pg,22,[hbogo],[animation,action,adventure]).
movie(wing_commander,mark_hamill,pg13,100,[prime],[action,adventure,sci-fi]).
movie(jay_and_silent_bob_strike_back,mark_hamill,r,104,[prime],[comedy]).
movie(village_of_the_damned,mark_hamill,r,99,[hbogo],[horror,sci-fi,thriller]).
movie(corvette_summer,mark_hamill,pg,105,[netflix],[comedy,romance]).
movie(the_guyver,mark_hamill,r,88,[prime],[action,horror,sci-fi]).
movie(sushi_girl,mark_hamill,r,98,[netflix],[crime,drama,thriller]).
movie(body_bags,mark_hamill,r,94,[hbogo],[horror]).
movie(the_flash,mark_hamill,pg,43,[netflix],[action,adventure,drama]).
movie(airborne,mark_hamill,pg,91,[prime],[action,adventure,family]).
movie(black_magic_woman,mark_hamill,r,87,[netflix],[drama,horror,thriller]).
movie(the_big_red_one,mark_hamill,r,113,[hbogo],[drama,war]).
movie(the_city_of_lost_children,mark_hamill,pg13,108,[prime],[drama,fantasy,sci-fi]).
movie(camelot,mark_hamill,pg13,126,[netflix],[animation,adventure,fantasy]).
movie(robot_chicken,mark_hamill,pg,11,[hbogo],[animation,comedy]).
movie(the_nerds,mark_hamill,pg13,100,[prime],[comedy]).
movie(amityville_dollhouse,mark_hamill,r,92,[hbogo],[horror]).
movie(slipstream,mark_hamill,pg,102,[netflix],[sci-fi]).
movie(time_runner,mark_hamill,r,90,[prime],[action,sci-fi]).
movie(batman_mask_of_the_phantasm,mark_hamill,pg,76,[hbogo],[animation,action,adventure]).
movie(earth_angel,mark_hamill,pg,92,[netflix],[drama,fantasy]).
movie(mutiny,mark_hamill,pg13,98,[prime],[action,adventure]).

movie(man_of_steel,henry_cavill,pg13,143,[netflix],[action,adventure,sci-fi]).
movie(batman_v_superman:dawn_of_justice,henry_cavill,pg13,151,[netflix],[action,adventure,sci-fi]).
movie(justice_league,henry_cavill,pg13,120,[hbogo],[action,adventure,fantasy,sci-fi]).
movie(the_man_from_u.n.c.l.e,henry_cavill,pg13,116,[netflix],[action,adventure,comedy]).
movie(immortals,henry_cavill,r,110,[prime],[action,drama,fantasy]).
movie(stardust,henry_cavill,pg13,127,[hbogo],[adventure,drama,family]).
movie(sand_castle,henry_cavill,r,113,[netflix],[drama,war]).
movie(night_hunter,henry_cavill,r,98,[prime],[action,crime,drama]).
movie(cold_light_of_day,henry_cavill,pg13,93,[netflix],[action,thriller]).
movie(blood_creek,henry_cavill,r,90,[hbogo],[horror,thriller]).
movie(red_riding_hood,henry_cavill,pg13,99,[prime],[drama,fantasy,romance]).
movie(the_count_of_monte_cristo,henry_cavill,pg13,131,[netflix],[action,adventure,drama]).
movie(tristan_and_isolde,henry_cavill,pg13,125,[prime],[drama,romance]).
movie(the_cold_light_of_day,henry_cavill,pg13,93,[hbogo],[action,thriller]).
movie(hellraiser:hellworld,henry_cavill,r,91,[prime],[horror,mystery,thriller]).
movie(the_witcher:nightmare_of_the_wolf,henry_cavill,pg13,81,[netflix],[animation,action,adventure]).
movie(the_immortals_2,henry_cavill,pg13,108,[prime],[action,drama,fantasy]).
movie(sunset_and_vine,henry_cavill,pg13,105,[hbogo],[drama,romance]).
movie(shadow_of_the_dragon,henry_cavill,pg13,113,[netflix],[action,adventure,fantasy]).
movie(flight_of_the_witch,henry_cavill,r,102,[prime],[horror,thriller]).
movie(a_fall_from_grace,henry_cavill,pg13,115,[hbogo],[drama,mystery,thriller]).
movie(iron_clad,henry_cavill,r,121,[netflix],[action,adventure,drama]).
movie(vanity_fair,henry_cavill,pg13,141,[prime],[drama,romance]).
movie(charlie_and_the_chocolate_factory,henry_cavill,pg13,115,[hbogo],[adventure,comedy,family]).
movie(the_tudors,henry_cavill,r,115,[netflix],[biography,drama,history]).

movie(indiana_jones_and_the_raiders_of_the_lost_ark,harrison_ford,pg,115,[prime],[action,adventure]).
movie(indiana_jones_and_the_last_crusade,harrison_ford,pg13,127,[netflix,prime],[action,adventure]).
movie(indiana_jones_and_the_temple_of_doom,harrison_ford,pg,118,[netflix,prime],[action,adventure]).
movie(the_fugitive,harrison_ford,pg13,130,[netflix],[action,crime,drama]).
movie(patriot_games,harrison_ford,r,117,[prime],[action,thriller]).
movie(clear_and_present_danger,harrison_ford,pg13,141,[prime],[action,drama,thriller]).
movie(air_force_one,harrison_ford,r,124,[netflix],[action,drama,thriller]).
movie(witness,harrison_ford,r,112,[hbogo],[crime,drama,romance]).
movie(the_mosquito_coast,harrison_ford,pg13,117,[prime],[adventure,drama]).
movie(six_days_seven_nights,harrison_ford,pg13,98,[netflix],[action,adventure,comedy]).
movie(the_devils_own,harrison_ford,r,107,[hbogo],[crime,drama,thriller]).
movie(random_hearts,harrison_ford,r,133,[prime],[drama,romance,thriller]).
movie(sabrina,harrison_ford,pg,127,[netflix],[comedy,drama,romance]).
movie(framing_john_delorean,harrison_ford,r,109,[hbogo],[documentary,biography]).
movie(ford_v_ferrari,harrison_ford,pg13,152,[prime],[action,biography,drama]).
movie(cowboys_and_aliens,harrison_ford,pg13,119,[netflix],[action,sci-fi,thriller]).
movie(hollywood_homicide,harrison_ford,pg13,116,[prime],[action,comedy,crime]).
movie(42,harrison_ford,pg13,128,[hbogo],[biography,drama,sport]).
movie(american_graffiti,harrison_ford,pg,110,[netflix],[comedy,drama]).
movie(the_age_of_adaline,harrison_ford,pg13,112,[prime],[drama,romance]).
movie(extraordinary_measures,harrison_ford,pg,106,[hbogo],[drama]).
movie(k19_the_widowmaker,harrison_ford,pg13,138,[netflix],[drama,history,thriller]).
movie(morning_glory,harrison_ford,pg13,107,[prime],[comedy,drama,romance]).
movie(regarding_henry,harrison_ford,pg13,108,[hbogo],[drama,romance]).
movie(the_call_of_the_wild,harrison_ford,pg,100,[prime],[adventure,drama,family]).
movie(working_girl,harrison_ford,r,113,[netflix],[comedy,drama,romance]).
movie(witness_2,harrison_ford,pg13,110,[hbogo],[crime,drama,thriller]).
movie(indiana_jones_and_the_crystal_skull,harrison_ford,pg13,122,[prime],[action,adventure]).

movie(harry_potter_and_the_philosophers_stone,daniel_radcliffe,pg13,158,[prime],[adventure,family,fantasy,mystery]).
movie(harry_potter_and_the_chamber_of_secrets,daniel_radcliffe,pg13,154,[prime],[adventure,family,fantasy,mystery]).
movie(harry_potter_and_the_prisoner_of_azkaban,daniel_radcliffe,pg13,146,[prime],[adventure,family,fantasy,mystery]).
movie(harry_potter_and_the_goblet_of_fire,daniel_radcliffe,pg13,157,[prime],[adventure,family,fantasy,mystery]).
movie(harry_potter_and_the_order_of_the_phoenix,daniel_radcliffe,pg13,156,[prime],[adventure,family,fantasy,mystery]).
movie(harry_potter_and_the_half-blood_prince,daniel_radcliffe,pg13,158,[prime],[adventure,family,fantasy,mystery]).
movie(harry_potter_and_the_deathly_hallows:part_1,daniel_radcliffe,pg13,136,[prime],[adventure,family,fantasy,mystery]).
movie(harry_potter_and_the_deathly_hallows:part_2,daniel_radcliffe,pg13,136,[prime],[adventure,family,fantasy,mystery]).
movie(now_you_see_me_2,daniel_radcliffe,pg13,129,[netflix],[action,adventure,comedy,crime,mystery,thriller]).
movie(the_woman_in_black,daniel_radcliffe,pg13,95,[prime],[drama,horror,thriller]).
movie(swiss_army_man,daniel_radcliffe,r,97,[netflix],[comedy,drama,fantasy]).
movie(jungle,daniel_radcliffe,r,115,[prime],[adventure,drama,thriller]).
movie(horns,daniel_radcliffe,r,120,[netflix],[drama,fantasy,horror]).
movie(imperium,daniel_radcliffe,r,109,[prime],[crime,drama,thriller]).
movie(escape_from_pretoria,daniel_radcliffe,pg13,106,[hbogo],[thriller,drama]).
movie(the_f_word,daniel_radcliffe,pg13,98,[netflix],[comedy,romance]).
movie(now_you_see_me_2,daniel_radcliffe,pg13,129,[prime],[action,adventure,comedy]).
movie(killers_anonymous,daniel_radcliffe,r,95,[netflix],[crime,drama,thriller]).
movie(guns_akimbo,daniel_radcliffe,r,95,[hbogo],[action,comedy,sci-fi]).
movie(lost_in_london,daniel_radcliffe,pg13,103,[prime],[comedy,drama]).
movie(the_gamechangers,daniel_radcliffe,pg13,90,[netflix],[biography,drama]).
movie(victor_frankenstein,daniel_radcliffe,pg13,110,[prime],[drama,horror,sci-fi]).
movie(playmobil_the_movie,daniel_radcliffe,g,99,[netflix],[animation,adventure,comedy]).
movie(brian_fantom,daniel_radcliffe,r,88,[hbogo],[comedy,drama]).
movie(what_if,daniel_radcliffe,pg13,102,[netflix],[comedy,romance]).
movie(weird_the_al_yankovic_story,daniel_radcliffe,pg13,108,[hbogo],[biography,comedy,music]).
movie(beasts_of_burden,daniel_radcliffe,r,90,[prime],[action,crime,drama]).
movie(the_lost_city,daniel_radcliffe,pg13,112,[netflix],[action,adventure,comedy]).
movie(dont_come_knocking,daniel_radcliffe,r,124,[hbogo],[drama]).

movie(a_few_good_men,tom_hanks,pg13,106,[netflix],[drama,thriller]).
movie(catch_me_if_you_can_2,tom_hanks,pg13,119,[netflix],[biography,crime,drama]).
movie(forrest_gump,tom_hanks,pg13,131,[netflix],[drama,romance]).
movie(cast_away,tom_hanks,pg13,128,[hbogo],[drama,romance]).
movie(the_green_mile,tom_hanks,pg13,120,[netflix],[drama,thriller]).
movie(big,tom_hanks,pg13,109,[netflix],[drama,comedy,fantasy]).
movie(toy_story,tom_hanks,pg13,110,[netflix],[action,adventure,comedy,sci-fi]).
movie(the_shawshank_redemption,tom_hanks,pg13,118,[netflix],[drama,thriller]).
movie(sleepless_in_seattle,tom_hanks,pg13,114,[netflix],[comedy,drama,romance]).
movie(the_terminal,tom_hanks,pg13,115,[netflix],[action,comedy,thriller]).
movie(hitch,tom_hanks,pg13,123,[netflix],[action,comedy,romance]).
movie(you_ve_got_mail,tom_hanks,pg13,122,[netflix],[comedy,romance]).
movie(sully,tom_hanks,pg13,116,[netflix],[biography,drama]).
movie(alice_in_wonderland,tom_hanks,pg13,112,[netflix],[action,adventure,comedy,fantasy]).
movie(alice_in_wonderland_2,tom_hanks,pg13,121,[netflix],[action,adventure,comedy,fantasy]).
movie(cast_away_2,tom_hanks,pg13,125,[hbogo],[drama,romance]).
movie(you_ve_got_mail_2,tom_hanks,pg13,132,[hbogo],[comedy,romance]).
movie(a_few_good_men_2,tom_hanks,pg13,130,[hbogo],[drama,thriller]).
movie(forrest_gump_2,tom_hanks,pg13,136,[hbogo],[drama,romance]).
movie(toy_story_2,tom_hanks,pg13,134,[hbogo],[action,adventure,comedy,sci-fi]).
movie(toy_story_3,tom_hanks,pg13,129,[hbogo],[action,adventure,comedy,sci-fi]).
movie(sleepless_in_seattle_2,tom_hanks,pg13,137,[hbogo],[comedy,romance]).
movie(catch_me_if_you_can_3,tom_hanks,pg13,121,[hbogo],[biography,crime,drama]).
movie(forrest_gump_3,tom_hanks,pg13,121,[hbogo],[drama,romance]).
movie(you_ve_got_mail_3,tom_hanks,pg13,121,[hbogo],[comedy,romance]).
movie(the_shawshank_redemption_2,tom_hanks,pg13,116,[hbogo],[drama,thriller]).

movie(speed,keanu_reeves,pg13,116,[netflix],[action,thriller]).
movie(john_wick,keanu_reeves,r,101,[hbogo],[action,crime,thriller]).
movie(constantine,keanu_reeves,pg13,112,[netflix],[action,drama,fantasy]).
movie(the_matrix,keanu_reeves,r,101,[hbogo],[action,sci-fi,thriller]).
movie(_47_meters_down,keanu_reeves,r,111,[hbogo],[action,thriller]).
movie(hard_target,keanu_reeves,pg13,104,[netflix],[action,comedy,thriller]).
movie(bill_and_ted_s_excellent_adventure,keanu_reeves,pg13,98,[netflix],[action,comedy,sci-fi]).
movie(speed_racer,keanu_reeves,pg13,117,[netflix],[action,adventure,comedy]).
movie(point_break,keanu_reeves,r,124,[hbogo],[action,drama,thriller]).
movie(john_wick_2,keanu_reeves,r,134,[hbogo],[action,thriller]).
movie(john_wick_3,keanu_reeves,r,138,[hbogo],[action,thriller]).
movie(hard_target_2,keanu_reeves,pg13,127,[netflix],[action,comedy,thriller]).
movie(john_wick_4,keanu_reeves,r,138,[hbogo],[action,thriller]).
movie(bill_and_ted_s_adventure,keanu_reeves,pg13,133,[netflix],[action,comedy,sci-fi]).
movie(speed_racer_2,keanu_reeves,pg13,126,[netflix],[action,adventure,comedy]).
movie(the_replacements,keanu_reeves,pg13,113,[netflix],[action,comedy,drama]).
movie(a_walk_in_the_sun,keanu_reeves,r,105,[hbogo],[drama,thriller]).
movie(constantine_2,keanu_reeves,pg13,126,[netflix],[action,drama,fantasy]).
movie(the_devil_s_advocate,keanu_reeves,r,144,[hbogo],[drama,horror]).
movie(the_lake_house,keanu_reeves,pg13,99,[netflix],[drama,romance]).
movie(something_s_gotta_give,keanu_reeves,pg13,128,[netflix],[comedy,romance]).

movie(inception,leonardo_dicaprio,pg13,148,[netflix],[action,adventure,sci-fi,thriller]).
movie(once_upon_a_time_in_hollywood,leonardo_dicaprio,r,161,[netflix],[drama,comedy]).
movie(titanic,leonardo_dicaprio,pg13,194,[hbogo],[drama,romance]).
movie(the_departed,leonardo_dicaprio,r,151,[hbogo],[crime,drama,thriller]).
movie(the_revenant,leonardo_dicaprio,r,156,[hbogo],[adventure,drama,thriller]).
movie(the_wolf_of_wall_street,leonardo_dicaprio,r,180,[hbogo],[biography,crime,drama]).
movie(the_aviator,leonardo_dicaprio,pg13,170,[hbogo],[biography,drama]).
movie(catch_me_if_you_can,leonardo_dicaprio,pg13,141,[netflix],[biography,crime,drama]).
movie(shutter_island,leonardo_dicaprio,r,138,[netflix],[drama,mystery]).
movie(the_great_gatsby,leonardo_dicaprio,pg13,143,[prime],[drama,romance]).
movie(body_of_lies,leonardo_dicaprio,r,128,[prime],[action,drama,thriller]).
movie(django_unchained,leonardo_dicaprio,r,165,[hbogo],[drama,western]).
movie(blood_diamond,leonardo_dicaprio,r,143,[prime],[adventure,drama,thriller]).
movie(revolutionary_road,leonardo_dicaprio,r,119,[prime],[drama,romance]).
movie(gangs_of_new_york,leonardo_dicaprio,r,167,[netflix],[crime,drama]).
movie(the_beach,leonardo_dicaprio,r,119,[netflix],[adventure,drama,romance]).
movie(romeo_and_juliet,leonardo_dicaprio,pg13,120,[prime],[drama,romance]).
movie(the_man_in_the_iron_mask,leonardo_dicaprio,pg13,132,[netflix],[action,adventure,drama]).
movie(the_11th_hour,leonardo_dicaprio,pg,95,[prime],[documentary]).
movie(marvins_room,leonardo_dicaprio,pg13,98,[prime],[drama]).
movie(the_quick_and_the_dead,leonardo_dicaprio,r,107,[prime],[action,thriller,western]).
movie(total_eclipse,leonardo_dicaprio,r,111,[prime],[biography,drama,romance]).
movie(don_t_look_up,leonardo_dicaprio,r,138,[netflix],[comedy,drama,sci-fi]).
movie(j_edgar,leonardo_dicaprio,r,137,[hbogo],[biography,crime,drama]).
movie(this_boys_life,leonardo_dicaprio,r,115,[prime],[biography,drama]).

movie(good_will_hunting,matt_damon,r,126,[netflix],[drama]).
movie(the_martian,matt_damon,pg13,141,[netflix],[adventure,comedy,drama,sci-fi]).
movie(interstellar,matt_damon,pg13,169,[netflix],[adventure,drama,sci-fi]).
movie(rounders,matt_damon,r,121,[netflix],[crime,drama]).
movie(the_talented_mr_ripley,matt_damon,r,124,[hbogo],[crime,drama,thriller]).
movie(the_bourne_identity,matt_damon,pg13,119,[netflix],[action,thriller]).
movie(the_bourne_supremacy,matt_damon,pg13,108,[netflix],[action,thriller]).
movie(the_bourne_ultimatum,matt_damon,pg13,115,[netflix],[action,thriller]).
movie(the_bourne_legacy,matt_damon,pg13,135,[netflix],[action,thriller]).
movie(the_bourne_sanction,matt_damon,pg13,145,[netflix],[action,thriller]).
movie(ocean_s_eleven,matt_damon,pg13,116,[netflix],[crime,drama,thriller]).
movie(ocean_s_twelve,matt_damon,pg13,125,[netflix],[crime,drama,thriller]).
movie(ocean_s_thirteen,matt_damon,pg13,122,[netflix],[crime,drama,thriller]).
movie(elysium,matt_damon,r,109,[netflix],[action,sci-fi]).
movie(ford_v_ferrari,matt_damon,pg13,152,[prime],[drama,sport]).
movie(down_sizing,matt_damon,r,135,[prime],[comedy,drama,sci-fi]).
movie(the_informant,matt_damon,r,108,[prime],[biography,comedy,crime]).
movie(the_monuments_men,matt_damon,pg13,118,[prime],[drama,history,war]).
movie(invictus,matt_damon,pg13,134,[prime],[biography,drama,sport]).
movie(the_great_wall,matt_damon,pg13,103,[netflix],[action,adventure]).
movie(we_bought_a_zoo,matt_damon,pg,124,[prime],[drama,comedy]).
movie(suburbicon,matt_damon,r,105,[prime],[crime,drama,mystery]).
movie(the_adjustment_bureau,matt_damon,pg13,106,[netflix],[romance,sci-fi,thriller]).
movie(legend_of_bagger_vance,matt_damon,pg13,126,[prime],[drama,fantasy,sport]).
movie(hereafter,matt_damon,pg13,129,[prime],[drama,fantasy]).

movie(interstellar,matthew_mcconaughey,pg13,169,[netflix,disney],[adventure,drama,sci-fi]).
movie(dallas_buyers_club,matthew_mcconaughey,r,117,[hbogo],[biography,drama]).
movie(the_lincoln_lawyer,matthew_mcconaughey,r,118,[netflix],[crime,drama,thriller]).
movie(dazed_and_confused,matthew_mcconaughey,r,102,[prime],[comedy,drama]).
movie(magic_mike,matthew_mcconaughey,r,110,[netflix],[comedy,drama]).
movie(the_gentlemen,matthew_mcconaughey,r,113,[netflix],[action,comedy,crime]).
movie(mud,matthew_mcconaughey,pg13,130,[prime],[drama]).
movie(killer_joe,matthew_mcconaughey,nc17,102,[prime],[crime,drama,thriller]).
movie(we_are_marshall,matthew_mcconaughey,pg,131,[netflix],[biography,drama,sport]).
movie(the_wolf_of_wall_street,matthew_mcconaughey,r,180,[hbogo],[biography,crime,drama]).
movie(how_to_lose_a_guy_in_10_days,matthew_mcconaughey,pg13,116,[netflix],[comedy,romance]).
movie(contact,matthew_mcconaughey,pg,150,[prime],[drama,mystery,sci-fi]).
movie(reign_of_fire,matthew_mcconaughey,pg13,101,[netflix],[action,adventure,fantasy]).
movie(frailty,matthew_mcconaughey,r,100,[prime],[crime,drama,thriller]).
movie(gold,matthew_mcconaughey,r,120,[prime],[adventure,drama,thriller]).
movie(white_boy_rick,matthew_mcconaughey,r,111,[prime],[biography,crime,drama]).
movie(free_state_of_jones,matthew_mcconaughey,r,139,[prime],[action,biography,drama]).
movie(tropic_thunder,matthew_mcconaughey,r,107,[prime],[action,comedy,war]).
movie(sahara,matthew_mcconaughey,pg13,124,[prime],[action,adventure,comedy,mystery]).
movie(lincoln_lawyer,matthew_mcconaughey,r,118,[netflix],[crime,drama,thriller]).
movie(serenity,matthew_mcconaughey,r,106,[prime],[drama,mystery,sci-fi]).
movie(bernie,matthew_mcconaughey,pg13,99,[prime],[biography,comedy,crime]).
movie(a_time_to_kill,matthew_mcconaughey,r,149,[hbogo],[crime,drama,thriller]).
movie(ghosts_of_girlfriends_past,matthew_mcconaughey,pg13,100,[netflix],[comedy,fantasy,romance]).
movie(boys_on_the_side,matthew_mcconaughey,r,115,[netflix],[comedy,drama]).
movie(failure_to_launch,matthew_mcconaughey,pg13,97,[netflix],[comedy,romance]).
movie(just_keep_livin,matthew_mcconaughey,r,89,[netflix],[comedy,drama]).
movie(amistad,matthew_mcconaughey,r,155,[netflix],[drama,history,mystery]).
movie(the_bachelor,matthew_mcconaughey,pg13,101,[prime],[comedy,romance]).

movie(finding_nemo,albert_brooks,g,100,[hbogo],[animation,comedy,family]).
movie(drive,albert_brooks,r,100,[netflix],[crime,drama]).
movie(broadcast_news,albert_brooks,r,133,[hbogo],[comedy,drama,romance]).
movie(defending_your_life,albert_brooks,pg,112,[netflix],[comedy,drama,fantasy]).
movie(lost_in_america,albert_brooks,r,91,[netflix],[comedy]).
movie(the_simpsons_movie,albert_brooks,pg13,87,[disneyplus],[animation,adventure,comedy]).
movie(real_life,albert_brooks,r,99,[prime],[comedy]).
movie(the_scout,albert_brooks,pg13,101,[netflix],[comedy,drama,sport]).
movie(looking_for_comedy_in_the_muslim_world,albert_brooks,pg13,98,[prime],[comedy]).
movie(the_twilight_zone:the_movie,albert_brooks,pg,101,[hulu],[fantasy,horror,sci-fi]).
movie(mother,albert_brooks,r,104,[hbogo],[comedy,drama,romance]).
movie(the_in-laws,albert_brooks,pg,103,[prime],[adventure,comedy,crime]).
movie(the_muse,albert_brooks,pg13,97,[prime],[comedy]).
movie(lost_in_america,albert_brooks,r,91,[netflix],[comedy]).
movie(modern_romance,albert_brooks,r,93,[prime],[comedy,drama,romance]).
movie(the_secret_life_of_pets,albert_brooks,pg,87,[netflix],[animation,adventure,comedy,family]).
movie(marley_and_me,albert_brooks,pg,115,[hulu],[comedy,drama,romance]).
movie(drive,albert_brooks,r,100,[netflix],[crime,drama]).
movie(the_simpsons_movie,albert_brooks,pg13,87,[disneyplus],[animation,adventure,comedy]).
movie(my_first_mister,albert_brooks,r,109,[prime],[comedy,drama,romance]).
movie(the_museum_of_modern_art,albert_brooks,pg,95,[prime],[comedy]).
movie(the_museum_of_modern_art_2,albert_brooks,pg13,96,[prime],[comedy]).
movie(looking_for_comedy_in_the_muslim_world,albert_brooks,pg13,98,[prime],[comedy]).
movie(the_muse,albert_brooks,pg13,97,[prime],[comedy]).
movie(hotel_transylvania_2,albert_brooks,pg,89,[hulu],[animation,comedy,family,fantasy]).
movie(inside_out,albert_brooks,pg,95,[disneyplus],[animation,adventure,comedy,drama,family,fantasy]).
movie(the_secret_life_of_pets_2,albert_brooks,pg,86,[netflix],[animation,adventure,comedy,family]).
movie(lost_in_america,albert_brooks,r,91,[netflix],[comedy]).
movie(mother,albert_brooks,r,104,[hbogo],[comedy,drama,romance]).

movie(kung_fu_panda,jack_black,pg,92,[netflix],[animation,action,comedy,family]).
movie(school_of_rock,jack_black,pg13,108,[netflix],[comedy,music]).
movie(jumanji:welcome_to_the_jungle,jack_black,pg13,119,[netflix],[action,adventure,comedy]).
movie(tenacious_d_in_the_pick_of_destiny,jack_black,r,93,[netflix],[adventure,comedy,music]).
movie(nacho_libre,jack_black,pg,92,[netflix],[comedy, family, sport]).
movie(kung_fu_panda_2,jack_black,pg,90,[netflix],[animation,action,adventure,comedy,family]).
movie(kung_fu_panda_3,jack_black,pg,95,[netflix],[animation,action,adventure,comedy,family]).
movie(bernie,jack_black,pg13,99,[prime],[biography,comedy,crime]).
movie(the_school_of_rock,jack_black,pg13,108,[netflix],[comedy,music]).
movie(tropic_thunder,jack_black,r,107,[prime],[action,comedy,war]).
movie(goosebumps,jack_black,pg,103,[netflix],[adventure,comedy,family,fantasy,horror]).
movie(enigma,jack_black,r,118,[netflix],[comedy,crime,mystery,thriller]).
movie(mars_attacks,jack_black,pg13,106,[netflix],[comedy,sci-fi]).
movie(be_kind_rewind,jack_black,pg13,102,[netflix],[comedy,drama]).
movie(king_kong,jack_black,pg13,187,[hbogo],[action,adventure,drama,fantasy]).
movie(shallow_hal,jack_black,pg13,113,[netflix],[comedy,drama,fantasy,romance]).
movie(natural_liberty,jack_black,pg13,113,[netflix],[comedy,crime,music]).
movie(shark_tale,jack_black,pg,90,[netflix],[animation,comedy,family,fantasy]).
movie(gulliver_s_travels,jack_black,pg,85,[netflix],[adventure,comedy,family,fantasy]).
movie(the_holiday,jack_black,pg13,138,[netflix],[comedy,drama,romance]).
movie(orange_county,jack_black,pg13,82,[netflix],[comedy,drama]).
movie(bongwater,jack_black,r,97,[prime],[comedy,drama,romance]).
movie(year_one,jack_black,pg13,97,[netflix],[adventure,comedy]).
movie(the_big_year,jack_black,pg,100,[netflix],[comedy]).
movie(anchorman_2:the_legend_continues,jack_black,pg13,119,[hulu],[comedy]).
movie(dead_man_walking,jack_black,r,122,[netflix],[crime,drama]).
movie(enigma,jack_black,r,118,[netflix],[comedy,crime,mystery,thriller]).
movie(the_brink,jack_black,r,97,[hbo],[comedy]).
movie(jackass_number_two,jack_black,r,92,[hulu],[documentary,action,comedy]).

movie(a_walk_to_remember,mandy_moore,pg,101,[netflix],[drama,romance]).
movie(tangled,mandy_moore,pg,100,[hbogo],[animation,comedy,family,romance,musical]).
movie(the_princess_diaries,mandy_moore,g,111,[disneyplus],[comedy, family, romance]).
movie(saved,mandy_moore,pg13,92,[prime],[comedy,drama]).
movie(how_to_deal,mandy_moore,pg13,101,[netflix],[comedy,drama,romance]).
movie(chasing_liberty,mandy_moore,pg13,111,[prime],[comedy,romance]).
movie(the_sisterhood_of_the_traveling_pants,mandy_moore,pg,119,[hbogo],[comedy,drama,family,romance]).
movie(_47_meters_down,mandy_moore,pg13,89,[netflix],[adventure,drama,horror,thriller]).
movie(the_darkest_minds,mandy_moore,pg13,104,[hbo],[action,adventure,drama,fantasy,romance,sci-fi]).
movie(aquamarine,mandy_moore,pg,104,[netflix],[comedy,fantasy,romance]).
movie(the_sisterhood_of_the_traveling_pants_2,mandy_moore,pg13,119,[hbogo],[comedy,drama,romance]).
movie(princess_diaries_2:royal_engagement,mandy_moore,g,113,[disneyplus],[comedy,drama,romance]).
movie(how_to_deal,mandy_moore,pg13,101,[netflix],[comedy,drama,romance]).
movie(tangled_2:the_lost_princess,mandy_moore,pg,92,[hbogo],[animation,adventure,comedy,family,musical,romance]).
movie(love_wedding_marriage,mandy_moore,pg13,90,[netflix],[comedy,romance]).
movie(tron:legacy,mandy_moore,pg,125,[disneyplus],[action,adventure,sci-fi]).
movie(aquamarine,mandy_moore,pg,104,[netflix],[comedy,fantasy,romance]).
movie(romance_and_cigarettes,mandy_moore,r,115,[prime],[comedy,musical,romance]).
movie(the_darkest_minds,mandy_moore,pg13,104,[hbo],[action,adventure,drama,fantasy,romance,sci-fi]).
movie(the_sisterhood_of_the_traveling_pants_2,mandy_moore,pg13,119,[hbogo],[comedy,drama,romance]).
movie(princess_diaries_2:royal_engagement,mandy_moore,g,113,[disneyplus],[comedy,drama,romance]).
movie(how_to_deal,mandy_moore,pg13,101,[netflix],[comedy,drama,romance]).
movie(tangled_2:the_lost_princess,mandy_moore,pg,92,[hbogo],[animation,adventure,comedy,family,musical,romance]).
movie(love_wedding_marriage,mandy_moore,pg13,90,[netflix],[comedy,romance]).
movie(tron:legacy,mandy_moore,pg,125,[disneyplus],[action,adventure,sci-fi]).
movie(the_darkest_minds,mandy_moore,pg13,104,[hbo],[action,adventure,drama,fantasy,romance,sci-fi]).

movie(the_lord_of_the_rings_the_fellowship_of_the_ring,elijah_wood,pg13,130,[hbogo],[drama,mystery,sci-fi]).
movie(the_lord_of_the_rings_the_two_towers,elijah_wood,pg13,179,[hbogo],[action,adventure,drama]).
movie(the_lord_of_the_rings_the_return_of_the_king,elijah_wood,pg13,201,[hbogo],[action,adventure,drama]).
movie(the_hobbit_an_unexpected_journey,elijah_wood,pg13,169,[hbogo],[adventure,fantasy]).
movie(the_hobbit_the_desolation_of_smaug,elijah_wood,pg13,161,[hbogo],[adventure,fantasy]).
movie(the_hobbit_the_battle_of_the_five_armies,elijah_wood,pg13,144,[hbogo],[adventure,fantasy]).
movie(spy_kids_3-d:game_over,elijah_wood,pg,84,[netflix],[action,adventure,comedy,family,sci-fi]).
movie(eternal_sunshine_of_the_spotless_mind,elijah_wood,r,108,[netflix],[drama,romance,sci-fi]).
movie(sin_city,elijah_wood,r,124,[hbogo],[crime,drama,thriller]).
movie(happy_feet,elijah_wood,pg,108,[hbogo],[animation,comedy, family, music]).
movie(happy_feet_two,elijah_wood,pg,100,[hbogo],[animation,comedy, family, music]).
movie(deep_impact,elijah_wood,pg13,120,[netflix],[action,drama,romance,sci-fi,thriller]).
movie(maniac,elijah_wood,nc17,89,[netflix],[drama,horror,thriller]).
movie(avalon,elijah_wood,r,107,[hbogo],[action,drama,fantasy,sci-fi]).
movie(oolong_courage:the_courage_to_run_away,elijah_wood,r,125,[netflix],[action,adventure,comedy,fantasy]).
movie(the_last_witch_hunter,elijah_wood,pg13,106,[netflix],[action,adventure,fantasy]).
movie(back_to_the_future_part_ii,elijah_wood,pg,108,[netflix],[adventure,comedy,sci-fi]).
movie(north,elijah_wood,pg,87,[netflix],[adventure,comedy,drama,family,fantasy]).
movie(the_good_son,elijah_wood,r,87,[netflix],[drama,horror,thriller]).
movie(spy_kids_3-d:game_over,elijah_wood,pg,84,[netflix],[action,adventure,comedy,family,sci-fi]).
movie(bobby,elijah_wood,r,117,[netflix],[biography,drama,history]).
movie(oliver_twist,elijah_wood,pg13,130,[netflix],[crime,drama,romance]).
movie(lexi,elijah_wood,pg,90,[netflix],[animation,comedy, family]).
movie(young_harry_houdini,elijah_wood,pg,96,[netflix],[biography,drama,history]).
movie(paradise_texas,elijah_wood,r,93,[netflix],[comedy,drama]).
movie(nim_s_island,elijah_wood,pg,96,[netflix],[adventure,comedy,family,fantasy]).
movie(bobby,elijah_wood,r,117,[netflix],[biography,drama,history]).
movie(flipper,elijah_wood,pg,95,[netflix],[adventure,comedy,drama,family]).
movie(huckleberry_finn,elijah_wood,pg,93,[netflix],[adventure,comedy,drama,family]).
movie(forever_my_love,elijah_wood,pg13,95,[netflix],[drama]).

movie(harry_potter_and_the_philosophers_stone,emma_watson,pg13,158,[prime],[adventure,family,fantasy,mystery]).
movie(harry_potter_and_the_chamber_of_secrets,emma_watson,pg13,154,[prime],[adventure,family,fantasy,mystery]).
movie(harry_potter_and_the_prisoner_of_azkaban,emma_watson,pg13,146,[prime],[adventure,family,fantasy,mystery]).
movie(harry_potter_and_the_goblet_of_fire,emma_watson,pg13,157,[prime],[adventure,family,fantasy,mystery]).
movie(harry_potter_and_the_order_of_the_phoenix,emma_watson,pg13,156,[prime],[adventure,family,fantasy,mystery]).
movie(harry_potter_and_the_half-blood_prince,emma_watson,pg13,158,[prime],[adventure,family,fantasy,mystery]).
movie(harry_potter_and_the_deathly_hallows:part_1,emma_watson,pg13,136,[prime],[adventure,family,fantasy,mystery]).
movie(harry_potter_and_the_deathly_hallows:part_2,emma_watson,pg13,136,[prime],[adventure,family,fantasy,mystery]).
movie(the_bling_ring,emma_watson,r,90,[netflix],[biography,crime,drama]).
movie(the_perks_of_being_a_wallflower,emma_watson,pg13,102,[netflix],[drama,romance]).
movie(beauty_and_the_beast,emma_watson,pg,129,[netflix],[family,fantasy,musical,romance]).
movie(little_women,emma_watson,pg,135,[hbogo],[drama,romance]).
movie(noah,emma_watson,pg13,138,[hbogo],[action,adventure,drama]).
movie(colonia,emma_watson,r,110,[netflix],[biography,drama,history]).
movie(regression,emma_watson,r,106,[netflix],[crime,drama,mystery]).
movie(my_week_with_marilyn,emma_watson,r,99,[netflix],[biography,drama]).
movie(the_circle,emma_watson,pg13,110,[netflix],[drama,sci-fi,thriller]).
movie(the_bling_ring,emma_watson,r,90,[netflix],[biography,crime,drama]).
movie(the_perks_of_being_a_wallflower,emma_watson,pg13,102,[netflix],[drama,romance]).
movie(beauty_and_the_beast,emma_watson,pg,129,[netflix],[family,fantasy,musical,romance]).
movie(little_women,emma_watson,pg,135,[hbogo],[drama,romance]).
movie(noah,emma_watson,pg13,138,[hbogo],[action,adventure,drama]).
movie(colonia,emma_watson,r,110,[netflix],[biography,drama,history]).
movie(regression,emma_watson,r,106,[netflix],[crime,drama,mystery]).
movie(my_week_with_marilyn,emma_watson,r,99,[netflix],[biography,drama]).
movie(the_circle,emma_watson,pg13,110,[netflix],[drama,sci-fi,thriller]).

movie(jumanji_welcome_to_the_jungle,dwayne_johnson,pg13,119,[netflix],[action,adventure,comedy,fantasy]).
movie(fast_and_furious_6,dwayne_johnson,pg13,130,[netflix],[action,adventure,crime,thriller]).
movie(moana,dwayne_johnson,pg,107,[disney],[animation,adventure,comedy, family, fantasy, musical]).
movie(skyscraper,dwayne_johnson,pg13,102,[netflix],[action,adventure,thriller]).
movie(rampage,dwayne_johnson,pg13,107,[netflix],[action,adventure,sci-fi,thriller]).
movie(fast_five,dwayne_johnson,pg13,130,[netflix],[action,adventure,crime,thriller]).
movie(fast_and_furious,dwayne_johnson,pg13,107,[netflix],[action,adventure,crime,thriller]).
movie(fast_and_furious_7,dwayne_johnson,pg13,137,[netflix],[action,adventure,crime,thriller]).
movie(furious_7,dwayne_johnson,pg13,137,[netflix],[action,adventure,crime,thriller]).
movie(the_fate_of_the_furious,dwayne_johnson,pg13,136,[netflix],[action,adventure,crime,thriller]).
movie(fighting_with_my_family,dwayne_johnson,pg13,108,[hbogo],[biography,comedy,drama,sport]).
movie(hobbs_and_shaw,dwayne_johnson,pg13,137,[netflix],[action,adventure,sci-fi]).
movie(journey_2_the_mysterious_island,dwayne_johnson,pg,94,[netflix],[action,adventure,comedy,family,fantasy,sci-fi]).
movie(hercules,dwayne_johnson,pg13,98,[netflix],[action,adventure,fantasy]).
movie(pain_and_gain,dwayne_johnson,r,129,[netflix],[action,comedy,crime,drama,thriller]).
movie(baywatch,dwayne_johnson,r,116,[netflix],[action,comedy,crime,drama,mystery]).
movie(gi_joe_retaliation,dwayne_johnson,pg13,123,[netflix],[action,adventure,sci-fi,thriller]).
movie(cats_and_dogs_the_revenge_of_kitty_galore,dwayne_johnson,pg,82,[netflix,prime],[action,adventure,comedy,family,fantasy]).
movie(tooth_fairy,dwayne_johnson,pg,101,[netflix],[comedy, family, fantasy]).
movie(fast_and_furious_6,dwayne_johnson,pg13,130,[netflix],[action,adventure,crime,thriller]).
movie(moana,dwayne_johnson,pg,107,[disney],[animation,adventure,comedy, family, fantasy, musical]).
movie(skyscraper,dwayne_johnson,pg13,102,[netflix],[action,adventure,thriller]).
movie(rampage,dwayne_johnson,pg13,107,[netflix],[action,adventure,sci-fi,thriller]).
movie(fast_five,dwayne_johnson,pg13,130,[netflix],[action,adventure,crime,thriller]).
movie(fast_and_furious,dwayne_johnson,pg13,107,[netflix],[action,adventure,crime,thriller]).
movie(fast_and_furious_7,dwayne_johnson,pg13,137,[netflix],[action,adventure,crime,thriller]).
movie(furious_7,dwayne_johnson,pg13,137,[netflix],[action,adventure,crime,thriller]).
movie(the_fate_of_the_furious,dwayne_johnson,pg13,136,[netflix],[action,adventure,crime,thriller]).
movie(fighting_with_my_family,dwayne_johnson,pg13,108,[hbogo],[biography,comedy,drama,sport]).
movie(hobbs_and_shaw,dwayne_johnson,pg13,137,[netflix],[action,adventure,sci-fi]).
movie(the_game_plan,dwayne_johnson,pg,110,[netflix],[comedy, family, sport]).
movie(race_to_witch_mountain,dwayne_johnson,pg,98,[netflix],[action, adventure, family, fantasy, sci-fi, thriller]).
movie(snitch,dwayne_johnson,pg13,112,[netflix],[action, drama, thriller]).
movie(san_andreas,dwayne_johnson,pg13,114,[netflix],[action, adventure, drama, thriller]).
movie(jumanji_the_next_level,dwayne_johnson,pg13,123,[netflix],[action, adventure, comedy, fantasy]).
movie(the_other_guys,dwayne_johnson,pg13,107,[netflix],[action, comedy, crime]).
movie(central_intelligence,dwayne_johnson,pg13,107,[netflix],[action, comedy, crime]).
movie(planet_51,dwayne_johnson,pg,91,[netflix],[animation, adventure, comedy, family, sci-fi]).
movie(the_rundown,dwayne_johnson,pg13,104,[netflix],[action, adventure, comedy, thriller]).
movie(race_to_witch_mountain,dwayne_johnson,pg,98,[netflix],[action, adventure, family, fantasy, sci-fi, thriller]).

movie(the_hunger_games,jennifer_lawrence,pg13,142,[netflix],[action,adventure,sci-fi,thriller]).
movie(silver_linings_playbook,jennifer_lawrence,r,122,[netflix],[comedy,drama,romance]).
movie(american_hustle,jennifer_lawrence,r,138,[netflix],[crime,drama]).
movie(x-men:first_class,jennifer_lawrence,pg13,132,[netflix],[action,adventure,sci-fi]).
movie(the_hunger_games:catching_fire,jennifer_lawrence,pg13,146,[netflix],[action,adventure,mystery,sci-fi,thriller]).
movie(the_hunger_games:mockingjay_part_1,jennifer_lawrence,pg13,123,[netflix],[action,adventure,sci-fi,thriller]).
movie(the_hunger_games:mockingjay_part_2,jennifer_lawrence,pg13,137,[netflix],[action,adventure,sci-fi,thriller]).
movie(passengers,jennifer_lawrence,pg13,116,[netflix],[drama,romance,sci-fi]).
movie(red_sparrow,jennifer_lawrence,r,140,[netflix],[action,drama,thriller]).
movie(winter_s_bone,jennifer_lawrence,r,100,[netflix],[drama,mystery]).
movie(mother,jennifer_lawrence,r,121,[netflix],[drama,horror,mystery]).
movie(joy,jennifer_lawrence,pg13,124,[netflix],[biography,drama]).
movie(the_hunger_games,jennifer_lawrence,pg13,142,[netflix],[action,adventure,sci-fi,thriller]).
movie(silver_linings_playbook,jennifer_lawrence,r,122,[netflix],[comedy,drama,romance]).
movie(american_hustle,jennifer_lawrence,r,138,[netflix],[crime,drama]).
movie(x-men:first_class,jennifer_lawrence,pg13,132,[netflix],[action,adventure,sci-fi]).
movie(the_hunger_games:catching_fire,jennifer_lawrence,pg13,146,[netflix],[action,adventure,mystery,sci-fi,thriller]).
movie(the_hunger_games:mockingjay_part_1,jennifer_lawrence,pg13,123,[netflix],[action,adventure,sci-fi,thriller]).
movie(the_hunger_games:mockingjay_part_2,jennifer_lawrence,pg13,137,[netflix],[action,adventure,sci-fi,thriller]).
movie(passengers,jennifer_lawrence,pg13,116,[netflix],[drama,romance,sci-fi]).
movie(red_sparrow,jennifer_lawrence,r,140,[netflix],[action,drama,thriller]).
movie(winter_s_bone,jennifer_lawrence,r,100,[netflix],[drama,mystery]).
movie(mother,jennifer_lawrence,r,121,[netflix],[drama,horror,mystery]).
movie(joy,jennifer_lawrence,pg13,124,[netflix],[biography,drama]).


%DATABAE_OF_BOLLYWOOD_MOVIES
movie(_3_idiots, aamir_khan, pg13, 170, [netflix, prime], [comedy, drama]).
movie(dangal, aamir_khan, pg13, 161, [disney], [biography, drama, sport]).
movie(lagaan, aamir_khan, pg, 224, [netflix], [adventure, drama, sport]).
movie(dil_chahta_hai, aamir_khan, pg, 183, [netflix], [comedy, drama, romance]).
movie(taare_zameen_par, aamir_khan, pg, 165, [netflix], [drama, family]).
movie(rang_de_basanti, aamir_khan, pg13, 157, [netflix], [comedy, drama, history]).
movie(mangal_pandey, aamir_khan, pg13, 150, [prime], [biography, drama, history]).
movie(dhoom_3, aamir_khan, pg13, 172, [prime], [action, thriller]).
movie(ghajini, aamir_khan, pg13, 183, [prime], [action, drama, mystery]).
movie(pk, aamir_khan, pg13, 153, [netflix], [comedy, drama, fantasy]).
movie(fanaa, aamir_khan, pg13, 168, [prime], [drama, romance, thriller]).
movie(sarfarosh, aamir_khan, pg, 174, [netflix], [action, drama, thriller]).
movie(andaaz_apna_apna, aamir_khan, pg, 160, [prime], [comedy, romance]).
movie(qayamat_se_qayamat_tak, aamir_khan, pg, 162, [prime], [drama, musical, romance]).
movie(jodha_akbar, aamir_khan, pg, 213, [netflix], [biography, drama, history]).
movie(talaash, aamir_khan, pg13, 139, [netflix], [crime, drama, thriller]).
movie(dil, aamir_khan, pg, 171, [prime], [comedy, drama, romance]).
movie(jo_jeeta_wohi_sikandar, aamir_khan, pg, 174, [prime], [drama, family, romance]).
movie(dil_hai_ke_manta_nahi, aamir_khan, pg, 165, [prime], [comedy, drama, romance]).
movie(raakh, aamir_khan, r, 120, [netflix], [crime, drama]).
movie(akele_hum_akele_tum, aamir_khan, pg, 165, [prime], [drama, musical, romance]).
movie(rangeela, aamir_khan, pg13, 145, [netflix], [comedy, drama, romance]).
movie(baazi, aamir_khan, pg13, 173, [prime], [action, drama, thriller]).
movie(mann, aamir_khan, pg13, 180, [netflix], [drama, romance]).
movie(mangal_pandey_the_rising, aamir_khan, pg13, 150, [prime], [biography, drama, history]).
movie(earth, aamir_khan, r, 110, [netflix], [drama, history, romance]).
movie(gulaam, aamir_khan, pg, 162, [prime], [action, crime, drama]).
movie(aatank_hi_aatank, aamir_khan, r, 150, [netflix], [action, crime, drama]).
movie(dharavi, aamir_khan, pg, 140, [prime], [crime, drama]).
movie(tum_mere_ho, aamir_khan, pg, 162, [netflix], [drama, fantasy, romance]).

movie(mughal_e_azam, dilip_kumar, pg, 197, [prime], [drama, history, romance]).
movie(devdas, dilip_kumar, pg, 159, [prime], [drama, musical, romance]).
movie(naya_daur, dilip_kumar, pg, 173, [prime], [drama, musical, romance]).
movie(madhumati, dilip_kumar, pg, 167, [prime], [drama, musical, mystery]).
movie(ganga_jamna, dilip_kumar, pg, 178, [prime], [crime, drama]).
movie(andaaz, dilip_kumar, pg, 148, [prime], [drama, musical, romance]).
movie(daag, dilip_kumar, pg, 157, [prime], [drama, musical, romance]).
movie(aan, dilip_kumar, pg, 161, [prime], [adventure, drama, romance]).
movie(kohinoor, dilip_kumar, pg, 151, [prime], [action, adventure, romance]).
movie(leader, dilip_kumar, pg, 174, [prime], [drama, musical, romance]).
movie(ram_aur_shyam, dilip_kumar, pg, 171, [prime], [comedy, drama, musical]).
movie(footpath, dilip_kumar, pg, 139, [prime], [crime, drama]).
movie(shakti, dilip_kumar, pg, 167, [prime], [action, crime, drama]).
movie(kala_pani, dilip_kumar, pg, 161, [prime], [drama, mystery, thriller]).
movie(mazdoor, dilip_kumar, pg, 156, [prime], [drama]).
movie(kranti, dilip_kumar, pg, 187, [prime], [action, drama, history]).
movie(vidhaata, dilip_kumar, pg, 156, [prime], [action, crime, drama]).
movie(saudagar, dilip_kumar, pg, 213, [prime], [drama, musical, romance]).
movie(dastaan, dilip_kumar, pg, 165, [prime], [drama, musical, romance]).
movie(dil_diyaa_dard_liyaa, dilip_kumar, pg, 165, [prime], [drama, musical, romance]).
movie(mela, dilip_kumar, pg, 157, [prime], [drama, musical, romance]).
movie(babul, dilip_kumar, pg, 166, [prime], [drama, musical, romance]).
movie(shabnam, dilip_kumar, pg, 161, [prime], [drama, musical, romance]).
movie(deedar, dilip_kumar, pg, 145, [prime], [drama, musical, romance]).
movie(uran_khatola, dilip_kumar, pg, 146, [prime], [adventure, drama, musical]).
movie(azad, dilip_kumar, pg, 164, [prime], [action, comedy, drama]).
movie(gunga_jumna, dilip_kumar, pg, 178, [prime], [action, crime, drama]).
movie(paigham, dilip_kumar, pg, 161, [prime], [drama]).
movie(taranaa, dilip_kumar, pg, 153, [prime], [drama, musical, romance]).
movie(sangdil, dilip_kumar, pg, 152, [prime], [drama, romance]).

movie(sholay, amitabh_bachchan, pg, 162, [prime], [action, adventure, comedy]).
movie(deewaar, amitabh_bachchan, pg13, 174, [prime], [action, crime, drama]).
movie(zanjeer, amitabh_bachchan, pg13, 143, [prime], [action, crime, drama]).
movie(don, amitabh_bachchan, pg13, 175, [prime], [action, crime, thriller]).
movie(amar_akbar_anthony, amitabh_bachchan, pg, 184, [prime], [action, comedy, drama]).
movie(kabhi_kabhie, amitabh_bachchan, pg, 178, [prime], [drama, musical, romance]).
movie(muqaddar_ka_sikandar, amitabh_bachchan, pg, 201, [prime], [action, drama, musical]).
movie(chupke_chupke, amitabh_bachchan, pg, 161, [prime], [comedy, drama, romance]).
movie(kala_pathear, amitabh_bachchan, pg13, 162, [prime], [action, drama]).
movie(silsila, amitabh_bachchan, pg, 183, [prime], [drama, musical, romance]).
movie(shakti, amitabh_bachchan, pg, 187, [prime], [action, crime, drama]).
movie(coolie, amitabh_bachchan, pg13, 174, [prime], [action, comedy, drama]).
movie(satte_pe_satta, amitabh_bachchan, pg, 160, [prime], [action, comedy, drama]).
movie(agneepath, amitabh_bachchan, r, 174, [prime], [action, crime, drama]).
movie(baghban, amitabh_bachchan, pg, 183, [prime], [drama, family, romance]).
movie(black, amitabh_bachchan, pg13, 122, [prime], [drama]).
movie(piku, amitabh_bachchan, pg, 123, [netflix], [comedy, drama]).
movie(pink, amitabh_bachchan, pg13, 136, [prime], [drama, thriller]).
movie(cheeni_kum, amitabh_bachchan, pg13, 140, [prime], [comedy, drama, romance]).
movie(pa, amitabh_bachchan, pg, 133, [prime], [drama]).
movie(sarkar, amitabh_bachchan, r, 124, [prime], [action, crime, drama]).
movie(khakee, amitabh_bachchan, pg13, 174, [prime], [action, crime, drama]).
movie(ankhen, amitabh_bachchan, pg13, 168, [prime], [comedy, crime, thriller]).
movie(mohabbatein, amitabh_bachchan, pg13, 216, [prime], [drama, musical, romance]).
movie(yaraana, amitabh_bachchan, pg13, 139, [prime], [action, drama, musical]).
movie(majboor, amitabh_bachchan, pg, 151, [prime], [drama, musical, thriller]).
movie(lawaaris, amitabh_bachchan, pg, 189, [prime], [action, drama]).
movie(sharaabi, amitabh_bachchan, pg13, 189, [prime], [comedy, drama, musical]).
movie(abhimaan, amitabh_bachchan, pg, 122, [prime], [drama, musical, romance]).
movie(kabhi_alvida_na_kehna, amitabh_bachchan, pg13, 193, [prime], [drama, musical, romance]).
movie(namak_halaal, amitabh_bachchan, pg13, 171, [prime], [comedy, drama, musical]).
movie(dostana, amitabh_bachchan, pg13, 153, [prime], [action, comedy, drama]).
movie(mard, amitabh_bachchan, pg13, 172, [prime], [action, drama]).
movie(toofan, amitabh_bachchan, pg13, 174, [prime], [action, adventure, drama]).
movie(sooryavansham, amitabh_bachchan, pg13, 176, [prime], [drama]).
movie(ankhen, amitabh_bachchan, pg13, 157, [prime], [action, comedy, crime]).
movie(alaap, amitabh_bachchan, pg, 161, [prime], [drama, musical]).
movie(chamelee_ki_shaadi, amitabh_bachchan, pg13, 142, [prime], [comedy, drama]).
movie(veer-zaara, amitabh_bachchan, pg13, 192, [prime], [drama, romance]).
movie(yudh, amitabh_bachchan, pg13, 166, [prime], [action, crime, drama]).

movie(khiladi, akshay_kumar, pg13, 157, [prime], [action, comedy, thriller]).
movie(main_khiladi_tu_anari, akshay_kumar, pg13, 175, [prime], [action, comedy, drama]).
movie(sabse_bada_khiladi, akshay_kumar, pg13, 174, [prime], [action, thriller]).
movie(mr_and_mrs_khiladi, akshay_kumar, pg13, 160, [prime], [comedy, drama, romance]).
movie(international_khiladi, akshay_kumar, pg13, 192, [prime], [action, crime, drama]).
movie(hera_pheri, akshay_kumar, pg13, 156, [netflix], [comedy, crime, drama]).
movie(dhadkan, akshay_kumar, pg13, 165, [prime], [drama, musical, romance]).
movie(awara_paagal_deewana, akshay_kumar, pg13, 158, [prime], [action, comedy, crime]).
movie(mujhse_shaadi_karogi, akshay_kumar, pg13, 163, [prime], [comedy, drama, romance]).
movie(garam_masala, akshay_kumar, pg13, 146, [prime], [comedy, drama]).
movie(hey_babyy, akshay_kumar, pg13, 140, [prime], [comedy, drama, romance]).
movie(singh_is_king, akshay_kumar, pg13, 135, [netflix], [action, comedy, drama]).
movie(housefull, akshay_kumar, pg13, 155, [prime], [comedy, drama, romance]).
movie(tezz, akshay_kumar, pg13, 122, [prime], [action, drama, thriller]).
movie(holiday, akshay_kumar, pg13, 170, [netflix], [action, drama, thriller]).
movie(baby, akshay_kumar, pg13, 160, [netflix], [action, thriller]).
movie(gabbar_is_back, akshay_kumar, pg13, 128, [prime], [action, crime, drama]).
movie(singh_is_bliing, akshay_kumar, pg13, 140, [prime], [action, comedy, drama]).
movie(airlift, akshay_kumar, pg13, 130, [netflix], [drama, history, thriller]).
movie(rustom, akshay_kumar, pg13, 148, [prime], [crime, drama, thriller]).
movie(jolly_llb_2, akshay_kumar, pg13, 137, [prime], [comedy, drama]).
movie(toilet_ek_prem_katha, akshay_kumar, pg13, 155, [prime], [comedy, drama, romance]).
movie(padman, akshay_kumar, pg13, 140, [netflix], [biography, comedy, drama]).
movie(gold, akshay_kumar, pg13, 150, [prime], [drama, history, sport]).
movie(kesari, akshay_kumar, pg13, 150, [prime], [action, drama, history]).
movie(mission_mangal, akshay_kumar, pg13, 130, [prime], [drama, history]).
movie(good_newwz, akshay_kumar, pg13, 132, [prime], [comedy, drama]).
movie(laxmii, akshay_kumar, pg13, 141, [prime], [comedy, horror]).
movie(bell_bottom, akshay_kumar, pg13, 123, [prime], [action, thriller]).
movie(sooryavanshi, akshay_kumar, pg13, 145, [netflix], [action, crime, thriller]).

movie(maine_pyar_kiya, salman_khan, pg, 192, [prime], [drama, musical, romance]).
movie(sajan, salman_khan, pg13, 181, [prime], [drama, musical, romance]).
movie(hum_aapke_hain_koun, salman_khan, pg, 206, [prime], [comedy, drama, musical]).
movie(karan_arjun, salman_khan, pg13, 175, [prime], [action, drama, fantasy]).
movie(jeet, salman_khan, pg13, 153, [prime], [action, drama, romance]).
movie(pyaar_kiya_to_darna_kya, salman_khan, pg13, 162, [prime], [comedy, drama, romance]).
movie(jab_pyaar_kisise_hota_hai, salman_khan, pg, 159, [prime], [comedy, drama, romance]).
movie(biwi_no_1, salman_khan, pg13, 159, [prime], [comedy, drama, romance]).
movie(hum_dil_de_chuke_sanam, salman_khan, pg13, 188, [prime], [drama, musical, romance]).
movie(tere_naam, salman_khan, pg13, 138, [prime], [drama, romance]).
movie(mujhse_shaadi_karogi, salman_khan, pg13, 163, [prime], [comedy, drama, romance]).
movie(no_entry, salman_khan, pg13, 158, [prime], [comedy, drama, romance]).
movie(maine_pyaar_kyun_kiya, salman_khan, pg13, 145, [prime], [comedy, drama, romance]).
movie(partner, salman_khan, pg13, 143, [prime], [comedy, drama, romance]).
movie(wanted, salman_khan, pg13, 154, [prime], [action, crime, thriller]).
movie(dabangg, salman_khan, pg13, 130, [prime], [action, comedy, crime]).
movie(bodyguard, salman_khan, pg13, 132, [prime], [action, comedy, drama]).
movie(ek_tha_tiger, salman_khan, pg13, 133, [prime], [action, adventure, thriller]).
movie(kick, salman_khan, pg13, 146, [prime], [action, comedy, crime]).
movie(bajrangi_bhaijaan, salman_khan, pg13, 163, [netflix], [drama]).
movie(prem_ratan_dhan_payo, salman_khan, pg, 174, [prime], [drama, musical, romance]).
movie(sultan, salman_khan, pg13, 170, [prime], [action, drama, sport]).
movie(tubelight, salman_khan, pg13, 136, [prime], [drama, war]).
movie(tiger_zinda_hai, salman_khan, pg13, 161, [prime], [action, adventure, thriller]).
movie(race_3, salman_khan, pg13, 160, [prime], [action, thriller]).
movie(bharat, salman_khan, pg13, 167, [prime], [action, comedy, drama]).
movie(dabangg_3, salman_khan, pg13, 159, [prime], [action, comedy, drama]).
movie(radha, salman_khan, pg13, 143, [prime], [action, romance]).
movie(antim, salman_khan, pg13, 140, [prime], [action, crime, drama]).
movie(kisi_ka_bhai_kisi_ki_jaan, salman_khan, pg13, 144, [prime], [action, comedy, drama]).

movie(kaho_na_pyaar_hai, hrithik_roshan, pg13, 172, [prime], [action, romance, thriller]).
movie(kabhi_khushi_kabhie_gham, hrithik_roshan, pg, 210, [prime], [drama, musical, romance]).
movie(mujhse_dosti_karoge, hrithik_roshan, pg, 149, [prime], [comedy, drama, romance]).
movie(koimil_gaya, hrithik_roshan, pg13, 171, [prime], [drama, fantasy, romance]).
movie(lakshya, hrithik_roshan, pg13, 186, [prime], [drama, war]).
movie(krishh, hrithik_roshan, pg13, 175, [prime], [action, adventure, sci-fi]).
movie(dhoom_2, hrithik_roshan, pg13, 152, [prime], [action, thriller]).
movie(jodhaa_akbar, hrithik_roshan, pg, 213, [prime], [action, drama, history]).
movie(kites, hrithik_roshan, pg13, 123, [prime], [action, drama, romance]).
movie(znmd, hrithik_roshan, pg13, 155, [prime], [adventure, comedy, drama]).
movie(agneepath, hrithik_roshan, pg13, 174, [prime], [action, crime, drama]).
movie(krishh_3, hrithik_roshan, pg13, 152, [prime], [action, adventure, sci-fi]).
movie(bang_bang, hrithik_roshan, pg13, 156, [prime], [action, adventure, comedy]).
movie(mohenjo_daro, hrithik_roshan, pg13, 155, [prime], [action, adventure, drama]).
movie(kaabil, hrithik_roshan, pg13, 139, [prime], [action, drama, thriller]).
movie(super_30, hrithik_roshan, pg13, 154, [prime], [biography, drama]).
movie(war, hrithik_roshan, pg13, 154, [prime], [action, thriller]).
movie(fiza, hrithik_roshan, pg13, 171, [prime], [action, drama, romance]).
movie(yaadein, hrithik_roshan, pg13, 171, [prime], [drama, musical, romance]).
movie(na_tum_jaano_na_hum, hrithik_roshan, pg13, 178, [prime], [drama, romance]).
movie(main_prem_ki_deewani_hoon, hrithik_roshan, pg13, 197, [prime], [comedy, drama, romance]).
movie(mission_kashmir, hrithik_roshan, pg13, 157, [prime], [action, drama, thriller]).
movie(mujhse_dosti_karoge, hrithik_roshan, pg13, 149, [prime], [comedy, drama, romance]).
movie(krishh_2, hrithik_roshan, pg13, 153, [prime], [action, adventure, sci-fi]).
movie(guzaarish, hrithik_roshan, pg13, 126, [prime], [drama, romance]).
movie(krrish, hrithik_roshan, pg13, 174, [prime], [action, adventure, sci-fi]).
movie(kites_the_remix, hrithik_roshan, pg13, 90, [prime], [action, drama, romance]).
movie(mohenjo_daro_the_beginning, hrithik_roshan, pg13, 160, [prime], [action, adventure, drama]).
movie(krrish_4, hrithik_roshan, pg13, 150, [prime], [action, adventure, sci-fi]).
movie(fighter, hrithik_roshan, pg13, 160, [prime], [action, drama]).

movie(the_lunchbox, irrfan_khan, pg, 104, [prime], [drama, romance]).
movie(paan_singh_tomar, irrfan_khan, pg13, 135, [prime], [biography, crime, drama]).
movie(madari, irrfan_khan, pg13, 133, [prime], [drama, thriller]).
movie(hindi_medium, irrfan_khan, pg, 132, [prime], [comedy, drama]).
movie(angrezi_medium, irrfan_khan, pg13, 145, [prime], [comedy, drama]).
movie(haider, irrfan_khan, r, 160, [netflix], [action, crime, drama]).
movie(the_namesake, irrfan_khan, pg13, 122, [prime], [drama]).
movie(salaam_bombay, irrfan_khan, r, 113, [prime], [crime, drama]).
movie(maqbool, irrfan_khan, r, 132, [prime], [crime, drama, thriller]).
movie(life_of_pi, irrfan_khan, pg, 127, [prime], [adventure, drama, fantasy]).
movie(slumdog_millionaire, irrfan_khan, r, 120, [prime], [drama, romance]).
movie(talvar, irrfan_khan, r, 132, [netflix], [crime, drama, mystery]).
movie(piku, irrfan_khan, pg, 123, [netflix], [comedy, drama]).
movie(blackmail, irrfan_khan, r, 138, [prime], [comedy, drama, thriller]).
movie(qissa, irrfan_khan, pg13, 109, [prime], [drama]).
movie(the_warrior, irrfan_khan, pg13, 86, [prime], [adventure, drama]).
movie(rog, irrfan_khan, r, 115, [prime], [drama, mystery, romance]).
movie(_7_khoon_maaf, irrfan_khan, r, 148, [prime], [drama, mystery, thriller]).
movie(deadline_sirf_24_ghante, irrfan_khan, r, 110, [prime], [thriller]).
movie(karwaan, irrfan_khan, pg13, 114, [prime], [comedy, drama]).
movie(qarib_qarib_singlle, irrfan_khan, pg13, 125, [prime], [comedy, drama, romance]).
movie(hisss, irrfan_khan, r, 98, [prime], [drama, fantasy, horror]).
movie(new_york, irrfan_khan, pg13, 153, [prime], [crime, drama, thriller]).
movie(inferno, irrfan_khan, pg13, 121, [prime], [action, adventure, crime]).
movie(the_amazing_spiderman, irrfan_khan, pg13, 136, [prime], [action, adventure, sci-fi]).
movie(jurassic_world, irrfan_khan, pg13, 124, [prime], [action, adventure, sci-fi]).
movie(doob_no_bed_of_roses, irrfan_khan, pg13, 110, [prime], [drama]).
movie(paan_singh_tomar, irrfan_khan, pg13, 135, [prime], [biography, crime, drama]).
movie(yeh_saal_zindagi, irrfan_khan, pg13, 128, [prime], [drama]).
movie(ghaat, irrfan_khan, pg13, 155, [prime], [crime, drama, thriller]).

movie(om_shanti_om, shah_rukh_khan, pg13, 162, [netflix], [action, comedy, drama, romance]).
movie(veer_zaara, shah_rukh_khan, pg, 192, [prime], [drama, musical, romance]).
movie(kuch_kuch_hota_hai, shah_rukh_khan, pg, 177, [netflix, prime], [comedy, drama, romance]).
movie(my_name_is_khan, shah_rukh_khan, pg13, 165, [netflix], [drama]).
movie(raees, shah_rukh_khan, r, 143, [netflix], [action, crime, drama]).
movie(dilwale, shah_rukh_khan, pg13, 158, [netflix], [action, comedy, drama, romance]).
movie(chennai_express, shah_rukh_khan, pg13, 141, [netflix], [action, comedy, romance]).
movie(kabhi_khushi_kabhie_gham, shah_rukh_khan, pg, 210, [netflix, prime], [drama, musical, romance]).
movie(dil_se, shah_rukh_khan, pg13, 163, [prime], [drama, romance, thriller]).
movie(veer_zaara, shah_rukh_khan, pg, 192, [prime], [drama, musical, romance]).
movie(don, shah_rukh_khan, pg13, 174, [prime], [action, crime, thriller]).
movie(kal_ho_na_ho, shah_rukh_khan, pg13, 186, [netflix], [comedy, drama, romance]).
movie(kabhi_alvida_na_kehna, shah_rukh_khan, pg13, 193, [netflix], [drama, romance]).
movie(swades, shah_rukh_khan, pg, 189, [netflix], [drama]).
movie(devdas, shah_rukh_khan, pg13, 185, [prime], [drama, musical, romance]).
movie(rab_ne_bana_di_jodi, shah_rukh_khan, pg, 167, [netflix], [comedy, drama, music, romance]).
movie(jab_tak_hai_jaan, shah_rukh_khan, pg13, 176, [netflix], [drama, romance]).
movie(english_babu_desi_mem, shah_rukh_khan, pg13, 187, [prime], [comedy, drama, romance]).
movie(ra_one, shah_rukh_khan, pg13, 156, [netflix], [action, adventure, sci-fi]).
movie(darr, shah_rukh_khan, r, 178, [prime], [crime, drama, romance, thriller]).
movie(oh_darling_yeh_hai_india, shah_rukh_khan, pg13, 163, [netflix], [comedy, drama, musical]).
movie(hey_ram, shah_rukh_khan, pg13, 186, [netflix], [crime, drama, history]).
movie(phailedo, shah_rukh_khan, pg, 132, [prime], [comedy, drama, romance]).
movie(maya_memsaab, shah_rukh_khan, r, 122, [prime], [drama]).
movie(ashaant, shah_rukh_khan, r, 139, [prime], [action, drama, thriller]).
movie(chaahat, shah_rukh_khan, r, 151, [prime], [drama, romance]).
movie(koyla, shah_rukh_khan, pg13, 166, [netflix], [action, drama, musical, romance]).
movie(guddu, shah_rukh_khan, pg13, 124, [prime], [drama, romance]).
movie(english_babu_desi_mem, shah_rukh_khan, pg13, 187, [prime], [comedy, drama, romance]).
movie(yes_boss, shah_rukh_khan, pg, 163, [netflix], [comedy, drama, musical, romance]).

movie(om_shanti_om, deepika_padukone, pg13, 162, [netflix], [action, comedy, drama, romance]).
movie(chennai_express, deepika_padukone, pg13, 141, [netflix], [action, comedy, romance]).
movie(yeh_jawaani_hai_deewani, deepika_padukone, pg13, 160, [netflix], [comedy, drama, romance]).
movie(bajirao_mastani, deepika_padukone, pg13, 158, [netflix], [drama, history, romance]).
movie(padmaavat, deepika_padukone, pg13, 164, [prime], [drama, history, romance]).
movie(cocktail, deepika_padukone, pg13, 146, [netflix], [comedy, drama, romance]).
movie(piku, deepika_padukone, pg, 123, [netflix], [comedy, drama]).
movie(raam_leela, deepika_padukone, r, 155, [netflix], [drama, musical, romance]).
movie(love_aaj_kal, deepika_padukone, pg13, 128, [netflix], [comedy, drama, romance]).
movie(ram_leela, deepika_padukone, r, 155, [netflix], [drama, musical, romance]).
movie(goliyon_ki_rasleela_ram_leela, deepika_padukone, r, 155, [netflix], [drama, musical, romance]).
movie(happy_new_year, deepika_padukone, pg13, 180, [netflix], [action, comedy, musical]).
movie(tamasha, deepika_padukone, pg13, 139, [netflix], [comedy, drama, romance]).
movie(om_shanti_om, deepika_padukone, pg13, 162, [netflix], [action, comedy, drama, romance]).
movie(kochadaiiyaan, deepika_padukone, pg, 124, [netflix], [action, adventure, history]).
movie(race_2, deepika_padukone, pg13, 145, [netflix], [action, crime, thriller]).
movie(bachna_ae_haseeno, deepika_padukone, pg13, 152, [netflix], [comedy, drama, romance]).
movie(karthik_calling_karthik, deepika_padukone, pg13, 135, [netflix], [drama, mystery, romance]).
movie(kaamath_kaamath, deepika_padukone, pg, 137, [netflix], [comedy]).
movie(dum_maaro_dum, deepika_padukone, r, 128, [netflix], [action, crime, drama]).
movie(what_b_to_do, deepika_padukone, pg, 119, [netflix], [comedy, romance]).
movie(om_shanti_om, deepika_padukone, pg13, 162, [netflix], [action, comedy, drama, romance]).
movie(lafangey_parindey, deepika_padukone, pg13, 126, [netflix], [drama, romance]).
movie(break_ke_baad, deepika_padukone, pg13, 118, [netflix], [comedy, drama, romance]).
movie(aarakshan, deepika_padukone, pg13, 164, [netflix], [drama]).
movie(dum_maaro_dum, deepika_padukone, r, 128, [netflix], [action, crime, drama]).
movie(dheera, deepika_padukone, pg13, 159, [netflix], [action, adventure, drama]).
movie(chandni_chowk_to_china, deepika_padukone, pg13, 154, [netflix], [action, adventure, comedy]).
movie(yeh_jawaani_hai_deewani, deepika_padukone, pg13, 160, [netflix], [comedy, drama, romance]).
movie(raam_leela, deepika_padukone, r, 155, [netflix], [drama, musical, romance]).
movie(goliyon_ki_rasleela_ram_leela, deepika_padukone, r, 155, [netflix], [drama, musical, romance]).


movie(ddlj, kajol_devgn, pg, 181, [prime], [comedy, drama, romance]).
movie(kuch_kuch_hota_hai, kajol_devgn, pg, 177, [netflix, prime], [comedy, drama, romance]).
movie(kabhi_khushi_kabhie_gham, kajol_devgn, pg, 210, [netflix], [drama, musical, romance]).
movie(fanaa, kajol_devgn, pg13, 168, [prime], [drama, romance, thriller]).
movie(baazigar, kajol_devgn, pg, 181, [netflix], [crime, drama, thriller]).
movie(my_name_is_khan, kajol_devgn, pg13, 165, [netflix], [drama]).
movie(kuch_kuch_hota_hai, kajol_devgn, pg, 177, [netflix, prime], [comedy, drama, romance]).
movie(helicopter_eela, kajol_devgn, pg, 135, [prime], [drama]).
movie(kuch_kuch_hota_hai, kajol_devgn, pg, 177, [netflix, prime], [comedy, drama, romance]).
movie(kabhi_khushi_kabhie_gham, kajol_devgn, pg, 210, [netflix], [drama, musical, romance]).
movie(fanaa, kajol_devgn, pg13, 168, [prime], [drama, romance, thriller]).
movie(baazigar, kajol_devgn, pg, 181, [netflix], [crime, drama, thriller]).
movie(kal_ho_na_ho, kajol_devgn, pg13, 186, [netflix], [comedy, drama, romance]).
movie(ishq, kajol_devgn, pg13, 161, [netflix], [action, comedy, drama]).
movie(kuch_kuch_hota_hai, kajol_devgn, pg, 177, [netflix, prime], [comedy, drama, romance]).
movie(dilwale, kajol_devgn, pg13, 158, [netflix], [action, comedy, drama]).
movie(helicopter_eela, kajol_devgn, pg, 135, [prime], [drama]).
movie(dilwale, kajol_devgn, pg13, 158, [netflix], [action, comedy, drama]).
movie(ishq, kajol_devgn, pg13, 161, [netflix], [action, comedy, drama]).
movie(udaan, kajol_devgn, pg13, 127, [prime], [drama]).
movie(my_name_is_khan, kajol_devgn, pg13, 165, [netflix], [drama]).
movie(we_are_family, kajol_devgn, pg13, 115, [prime], [drama]).
movie(fanaa, kajol_devgn, pg13, 168, [prime], [drama, romance, thriller]).
movie(kabhi_khushi_kabhie_gham, kajol_devgn, pg, 210, [netflix], [drama, musical, romance]).
movie(dilwale, kajol_devgn, pg13, 158, [netflix], [action, comedy, drama]).
movie(baazigar, kajol_devgn, pg, 181, [netflix], [crime, drama, thriller]).
movie(ishq, kajol_devgn, pg13, 161, [netflix], [action, comedy, drama]).
movie(kuch_kuch_hota_hai, kajol_devgn, pg, 177, [netflix, prime], [comedy, drama, romance]).
movie(udaan, kajol_devgn, pg13, 127, [prime], [drama]).
movie(kuch_kuch_hota_hai, kajol_devgn, pg, 177, [netflix, prime], [comedy, drama, romance]).

movie(rockstar, ranbir_kapoor, pg13, 159, [prime], [drama, music, romance]).
movie(yeh_jawaani_hai_deewani, ranbir_kapoor, pg13, 160, [netflix], [comedy, drama, romance]).
movie(barfi, ranbir_kapoor, pg, 151, [netflix], [comedy, drama, romance]).
movie(sanju, ranbir_kapoor, r, 155, [netflix], [biography, drama]).
movie(tamasha, ranbir_kapoor, pg13, 139, [prime], [drama, romance]).
movie(rockstar, ranbir_kapoor, pg13, 159, [prime], [drama, music, romance]).
movie(sanju, ranbir_kapoor, r, 155, [netflix], [biography, drama]).
movie(rocket_singh_salesman_of_the_year, ranbir_kapoor, pg, 156, [netflix], [comedy, drama]).
movie(bachna_ae_haseeno, ranbir_kapoor, pg13, 152, [netflix], [comedy, drama, romance]).
movie(ae_dil_hai_mushkil, ranbir_kapoor, pg13, 158, [netflix], [drama, music, romance]).
movie(raajneeti, ranbir_kapoor, pg13, 163, [netflix], [action, crime, drama]).
movie(bombay_velvet, ranbir_kapoor, r, 149, [netflix], [action, crime, drama]).
movie(wake_up_sid, ranbir_kapoor, pg, 138, [prime], [comedy, drama, romance]).
movie(bachna_ae_haseeno, ranbir_kapoor, pg13, 152, [netflix], [comedy, drama, romance]).
movie(rockstar, ranbir_kapoor, pg13, 159, [prime], [drama, music, romance]).
movie(yeh_jawaani_hai_deewani, ranbir_kapoor, pg13, 160, [netflix], [comedy, drama, romance]).
movie(barfi, ranbir_kapoor, pg, 151, [netflix], [comedy, drama, romance]).
movie(rockstar, ranbir_kapoor, pg13, 159, [prime], [drama, music, romance]).
movie(tamasha, ranbir_kapoor, pg13, 139, [prime], [drama, romance]).
movie(raajneeti, ranbir_kapoor, pg13, 163, [netflix], [action, crime, drama]).
movie(bombay_velvet, ranbir_kapoor, r, 149, [netflix], [action, crime, drama]).
movie(wake_up_sid, ranbir_kapoor, pg, 138, [prime], [comedy, drama, romance]).
movie(bachna_ae_haseeno, ranbir_kapoor, pg13, 152, [netflix], [comedy, drama, romance]).
movie(sanju, ranbir_kapoor, r, 155, [netflix], [biography, drama]).
movie(rocket_singh_salesman_of_the_year, ranbir_kapoor, pg, 156, [netflix], [comedy, drama]).
movie(roy, ranbir_kapoor, pg13, 146, [netflix], [action, drama, romance]).
movie(besharam, ranbir_kapoor, pg13, 143, [netflix], [action, comedy, romance]).
movie(jagga_jasoos, ranbir_kapoor, pg, 161, [netflix], [action, adventure, comedy]).
movie(ajab_prem_ki_ghazab_kahani, ranbir_kapoor, pg, 150, [netflix], [action, comedy, romance]).
movie(ae_dil_hai_mushkil, ranbir_kapoor, pg13, 158, [netflix], [drama, music, romance]).
movie(roy, ranbir_kapoor, pg13, 146, [netflix], [action, drama, romance]).

movie(rockstar, ranbir_kapoor, pg13, 159, [prime], [drama, music, romance]).
movie(yeh_jawaani_hai_deewani, ranbir_kapoor, pg13, 160, [netflix], [comedy, drama, romance]).
movie(barfi, ranbir_kapoor, pg, 151, [netflix], [comedy, drama, romance]).
movie(sanju, ranbir_kapoor, r, 155, [netflix], [biography, drama]).
movie(tamasha, ranbir_kapoor, pg13, 139, [prime], [drama, romance]).
movie(rockstar, ranbir_kapoor, pg13, 159, [prime], [drama, music, romance]).
movie(sanju, ranbir_kapoor, r, 155, [netflix], [biography, drama]).
movie(rocket_singh_salesman_of_the_year, ranbir_kapoor, pg, 156, [netflix], [comedy, drama]).
movie(bachna_ae_haseeno, ranbir_kapoor, pg13, 152, [netflix], [comedy, drama, romance]).
movie(ae_dil_hai_mushkil, ranbir_kapoor, pg13, 158, [netflix], [drama, music, romance]).
movie(raajneeti, ranbir_kapoor, pg13, 163, [netflix], [action, crime, drama]).
movie(bombay_velvet, ranbir_kapoor, r, 149, [netflix], [action, crime, drama]).
movie(wake_up_sid, ranbir_kapoor, pg, 138, [prime], [comedy, drama, romance]).
movie(bachna_ae_haseeno, ranbir_kapoor, pg13, 152, [netflix], [comedy, drama, romance]).
movie(rockstar, ranbir_kapoor, pg13, 159, [prime], [drama, music, romance]).
movie(yeh_jawaani_hai_deewani, ranbir_kapoor, pg13, 160, [netflix], [comedy, drama, romance]).
movie(barfi, ranbir_kapoor, pg, 151, [netflix], [comedy, drama, romance]).
movie(rockstar, ranbir_kapoor, pg13, 159, [prime], [drama, music, romance]).
movie(tamasha, ranbir_kapoor, pg13, 139, [prime], [drama, romance]).
movie(raajneeti, ranbir_kapoor, pg13, 163, [netflix], [action, crime, drama]).
movie(bombay_velvet, ranbir_kapoor, r, 149, [netflix], [action, crime, drama]).
movie(wake_up_sid, ranbir_kapoor, pg, 138, [prime], [comedy, drama, romance]).
movie(bachna_ae_haseeno, ranbir_kapoor, pg13, 152, [netflix], [comedy, drama, romance]).
movie(sanju, ranbir_kapoor, r, 155, [netflix], [biography, drama]).
movie(rocket_singh_salesman_of_the_year, ranbir_kapoor, pg, 156, [netflix], [comedy, drama]).
movie(roy, ranbir_kapoor, pg13, 146, [netflix], [action, drama, romance]).
movie(besharam, ranbir_kapoor, pg13, 143, [netflix], [action, comedy, romance]).
movie(jagga_jasoos, ranbir_kapoor, pg, 161, [netflix], [action, adventure, comedy]).
movie(ajab_prem_ki_ghazab_kahani, ranbir_kapoor, pg, 150, [netflix], [action, comedy, romance]).
movie(ae_dil_hai_mushkil, ranbir_kapoor, pg13, 158, [netflix], [drama, music, romance]).
movie(roy, ranbir_kapoor, pg13, 146, [netflix], [action, drama, romance]).

movie(munna_bhai_mbbs, sanjay_dutt, pg13, 156, [prime], [comedy, drama]).
movie(lage_raho_munna_bhai, sanjay_dutt, pg13, 144, [prime], [comedy, drama, romance]).
movie(vaastav, sanjay_dutt, r, 145, [netflix], [crime, drama]).
movie(khalnayak, sanjay_dutt, r, 190, [prime], [action, crime, drama]).
movie(sadak, sanjay_dutt, r, 134, [prime], [romance, thriller]).
movie(saanjh, sanjay_dutt, pg13, 102, [netflix], [crime, drama]).
movie(hathyar, sanjay_dutt, r, 135, [prime], [action, crime, drama]).
movie(shabd, sanjay_dutt, pg13, 155, [prime], [drama, romance, thriller]).
movie(kaante, sanjay_dutt, r, 152, [netflix], [action, crime, drama]).
movie(musafir, sanjay_dutt, r, 152, [prime], [action, crime, thriller]).
movie(mission_kashmir, sanjay_dutt, pg13, 154, [netflix], [action, drama, thriller]).
movie(aladin, sanjay_dutt, pg, 132, [netflix], [action, adventure, comedy]).
movie(vaah_life_ho_toh_aisi, sanjay_dutt, pg, 132, [prime], [comedy, drama, family]).
movie(haseena_maansoor, sanjay_dutt, pg, 137, [netflix], [action, crime, drama]).
movie(policegiri, sanjay_dutt, pg13, 141, [prime], [action, comedy]).
movie(kachche_dhaage, sanjay_dutt, pg13, 144, [netflix], [action, drama]).
movie(plan, sanjay_dutt, r, 149, [netflix], [action, crime]).
movie(namak, sanjay_dutt, r, 169, [prime], [action, drama]).
movie(kartoos, sanjay_dutt, r, 158, [netflix], [action, crime, drama]).
movie(chor_machaye_shor, sanjay_dutt, pg, 145, [prime], [action, comedy, crime]).
movie(daud_fun_on_the_run, sanjay_dutt, pg13, 150, [netflix], [action, crime, thriller]).
movie(kaante, sanjay_dutt, r, 152, [netflix], [action, crime, drama]).
movie(khauff, sanjay_dutt, pg13, 137, [netflix], [action, drama, thriller]).
movie(khalnayak, sanjay_dutt, r, 190, [prime], [action, crime, drama]).
movie(lage_raho_munna_bhai, sanjay_dutt, pg13, 144, [prime], [comedy, drama, romance]).
movie(munna_bhai_mbbs, sanjay_dutt, pg13, 156, [prime], [comedy, drama]).
movie(namak, sanjay_dutt, r, 169, [prime], [action, drama]).
movie(policegiri, sanjay_dutt, pg13, 141, [prime], [action, comedy]).
movie(plan, sanjay_dutt, r, 149, [netflix], [action, crime]).
movie(son_of_sardaar, sanjay_dutt, pg, 141, [netflix], [action, comedy]).

movie(omkara, ajay_devgn, r, 155, [prime], [action, crime, drama]).
movie(the_legend_of_bhagat_singh, ajay_devgn, pg13, 155, [netflix], [biography, drama, history]).
movie(gangaajal, ajay_devgn, r, 157, [prime], [crime, drama]).
movie(company, ajay_devgn, r, 155, [netflix], [crime, drama]).
movie(deewangee, ajay_devgn, r, 169, [netflix], [crime, drama, mystery]).
movie(zakhm, ajay_devgn, r, 126, [prime], [drama]).
movie(hum_dil_de_chuke_sanam, ajay_devgn, pg, 188, [prime], [comedy, drama, musical]).
movie(drishyam, ajay_devgn, pg13, 163, [prime], [crime, drama, thriller]).
movie(apaharan, ajay_devgn, pg13, 173, [netflix], [action, crime, drama]).
movie(qayamat_the_city_under_threat, ajay_devgn, pg13, 156, [netflix], [action, drama, thriller]).
movie(diljale, ajay_devgn, pg13, 180, [prime], [action, drama, romance]).
movie(phool_aur_kaante, ajay_devgn, pg, 173, [prime], [action, drama, romance]).
movie(kaal, ajay_devgn, pg13, 127, [netflix], [action, mystery, thriller]).
movie(once_upon_a_time_in_mumbaai, ajay_devgn, r, 134, [prime], [action, crime, drama]).
movie(singham, ajay_devgn, pg13, 143, [prime], [action, drama]).
movie(son_of_sardaar, ajay_devgn, pg, 141, [netflix], [action, comedy]).
movie(raajneeti, ajay_devgn, pg13, 163, [prime], [crime, drama, thriller]).
movie(shivaay, ajay_devgn, pg13, 153, [prime], [action, adventure, drama]).
movie(halla_bol, ajay_devgn, pg13, 142, [netflix], [crime, drama]).
movie(thaanedar, ajay_devgn, r, 155, [netflix], [action, crime, drama]).
movie(raja, ajay_devgn, pg13, 153, [prime], [action, drama, romance]).
movie(jigar, ajay_devgn, pg, 155, [netflix], [action, drama]).
movie(hogi_pyaa, ajay_devgn, pg, 136, [prime], [comedy, drama, romance]).
movie(jung, ajay_devgn, r, 152, [prime], [action, romance, thriller]).
movie(hum_kisi_se_kum_nahin, ajay_devgn, pg13, 162, [netflix], [action, comedy, drama]).
movie(hum_kisi_se_kum_nahin, ajay_devgn, pg13, 162, [netflix], [action, comedy, drama]).
movie(raajneeti, ajay_devgn, pg13, 163, [prime], [crime, drama, thriller]).
movie(kaal, ajay_devgn, pg13, 127, [netflix], [action, mystery, thriller]).
movie(ishq, ajay_devgn, pg, 161, [prime], [action, comedy, romance]).
movie(jigar, ajay_devgn, pg, 155, [netflix], [action, drama]).

movie(raazi, alia_bhatt, pg13, 138, [prime], [action, drama, thriller]).
movie(gully_boy, alia_bhatt, r, 153, [prime], [drama, music]).
movie(dear_zindagi, alia_bhatt, pg13, 151, [netflix], [drama]).
movie(highway, alia_bhatt, r, 133, [prime], [drama]).
movie(_2_states, alia_bhatt, pg13, 149, [prime], [comedy, drama, romance]).
movie(student_of_the_year, alia_bhatt, pg, 146, [netflix], [comedy, drama, romance]).
movie(udta_punjab, alia_bhatt, r, 148, [netflix], [crime, drama, thriller]).
movie(humpty_sharma_ki_dulhania, alia_bhatt, pg, 133, [netflix], [comedy, drama, romance]).
movie(kapoor_and_sons, alia_bhatt, pg13, 132, [netflix], [comedy, drama, romance]).
movie(raazi, alia_bhatt, pg13, 138, [prime], [action, drama, thriller]).
movie(kalank, alia_bhatt, pg13, 166, [prime], [drama, romance]).

movie(don, priyanka_chopra, pg13, 169, [prime], [action, crime, thriller]).
movie(don_2, priyanka_chopra, pg13, 148, [prime], [action, crime, thriller]).
movie(krrish, priyanka_chopra, pg, 154, [netflix], [action, adventure, sci-fi]).
movie(krrish_3, priyanka_chopra, pg13, 152, [netflix], [action, adventure, sci-fi]).
movie(_7_khoon_maaf, priyanka_chopra, r, 149, [netflix], [drama, mystery, thriller]).
movie(barfi, priyanka_chopra, pg, 151, [netflix], [comedy, drama, romance]).
movie(dostana, priyanka_chopra, pg13, 145, [prime], [comedy, drama, romance]).
movie(mary_kom, priyanka_chopra, pg13, 122, [prime], [action, biography, drama]).
movie(bajirao_mastani, priyanka_chopra, pg13, 158, [prime], [drama, history, romance]).
movie(agneepath, priyanka_chopra, r, 174, [netflix], [action, drama]).
movie(saat_khoon_maaf, priyanka_chopra, r, 149, [netflix], [drama, mystery, thriller]).
movie(dil_dhadakne_do, priyanka_chopra, pg13, 170, [netflix], [comedy, drama, romance]).
movie(gunday, priyanka_chopra, pg13, 152, [netflix], [action, crime, drama]).
movie(fashion, priyanka_chopra, r, 149, [prime], [drama]).
movie(mujhse_shaadi_karogi, priyanka_chopra, pg13, 163, [prime], [comedy, romance]).
movie(agraneebath, priyanka_chopra, r, 174, [netflix], [action, drama]).
movie(drona, priyanka_chopra, pg13, 138, [netflix], [action, adventure, fantasy]).
movie(anjaana_anjaani, priyanka_chopra, pg13, 151, [netflix], [comedy, drama, romance]).
movie(mary_kom, priyanka_chopra, pg13, 122, [prime], [action, biography, drama]).
movie(pyaar_impossible, priyanka_chopra, pg, 140, [prime], [comedy, romance]).
movie(barfi, priyanka_chopra, pg, 151, [netflix], [comedy, drama, romance]).
movie(teri_meri_kahaani, priyanka_chopra, pg13, 117, [netflix], [comedy, drama, romance]).
movie(agneepath, priyanka_chopra, r, 174, [netflix], [action, drama]).
movie(anjaana_anjaani, priyanka_chopra, pg13, 151, [netflix], [comedy, drama, romance]).
movie(tera_intezaar, priyanka_chopra, pg13, 108, [prime], [fantasy, romance, thriller]).
movie(teri_meri_kahaani, priyanka_chopra, pg13, 117, [netflix], [comedy, drama, romance]).
movie(tere_mere_beech_mein, priyanka_chopra, pg13, 150, [netflix], [drama, romance]).
movie(kaminey, priyanka_chopra, r, 130, [netflix], [action, crime, drama]).
movie(tera_intezaar, priyanka_chopra, pg13, 108, [prime], [fantasy, romance, thriller]).
movie(mary_kom, priyanka_chopra, pg13, 122, [prime], [action, biography, drama]).

movie(darr, juhi_chawla, pg13, 178, [netflix], [crime, drama, romance]).
movie(ishq, juhi_chawla, pg13, 161, [prime], [action, comedy, drama]).
movie(rajaji, juhi_chawla, pg, 162, [prime], [comedy, drama]).
movie(mera_saaya, juhi_chawla, pg, 121, [netflix], [drama, mystery, romance]).
movie(jhoot_bole_kauwa_kaate, juhi_chawla, pg, 143, [prime], [comedy, family]).
movie(phir_bhi_dil_hai_hindustani, juhi_chawla, pg13, 159, [netflix], [comedy, drama, music]).
movie(hum_hain_rahi_pyar_ke, juhi_chawla, pg, 163, [prime], [comedy, drama, family]).


%DATABASE_OF_LOLLYWOOD_MOVIES
movie(bol, mahira_khan, pg13, 150, [netflix], [drama]).
movie(bin_roye, mahira_khan, pg, 130, [prime], [drama, romance]).
movie(ho_mann_jahaan, mahira_khan, pg13, 170, [prime], [drama, music, romance]).
movie(verna, mahira_khan, r, 130, [prime], [drama, thriller]).
movie(superstar, mahira_khan, pg13, 138, [prime], [drama, romance]).
movie(saat_din_mohabbat_in, mahira_khan, pg13, 138, [netflix], [comedy, romance]).
movie(raees, mahira_khan, pg13, 143, [prime], [action, crime, drama]).
movie(manto, mahira_khan, r, 117, [prime], [biography, drama]).
movie(_7_din_mohabbat_in, mahira_khan, pg13, 138, [netflix], [comedy, drama, fantasy]).
movie(maula_jatt, mahira_khan, r, 153, [prime], [action, drama]).

movie(jawani_phir_nahi_ani, humayun_saeed, pg13, 160, [netflix], [comedy, drama, romance]).
movie(punjab_nahi_jaungi, humayun_saeed, pg13, 158, [netflix], [comedy, drama, romance]).
movie(shaadi_meri_zaroori_thi, humayun_saeed, pg13, 130, [prime], [drama, romance]).
movie(mai_hun_shahzad, humayun_saeed, pg13, 120, [prime], [drama, thriller]).
movie(jawani_phir_nahi_ani_2, humayun_saeed, pg13, 165, [netflix], [comedy, drama, romance]).
movie(yalgaar, humayun_saeed, r, 158, [prime], [action, drama, thriller]).
movie(bin_roye, humayun_saeed, pg, 130, [prime], [drama, romance]).
movie(waar, humayun_saeed, r, 130, [prime], [action, thriller]).
movie(love_you_ji, humayun_saeed, pg13, 140, [prime], [drama, romance]).
movie(kaaf_kangana, humayun_saeed, pg13, 160, [prime], [drama, romance]).
movie(revenge_of_the_worthless, humayun_saeed, r, 150, [netflix], [action, drama, war]).

movie(main_punjabi, humayun_saeed, pg13, 135, [prime], [drama, musical]).
movie(actor_in_law, mehwish_hayat, pg13, 116, [netflix], [comedy, drama]).
movie(punjabi_nahi_jaungi, mehwish_hayat, pg13, 160, [netflix], [comedy, drama, romance]).
movie(load_wedding, mehwish_hayat, pg13, 140, [prime], [comedy, drama, romance]).
movie(jawani_phir_nahi_ani, mehwish_hayat, pg13, 160, [netflix], [comedy, drama, romance]).
movie(chhalawa, mehwish_hayat, pg13, 135, [prime], [comedy, romance]).
movie(_3_bahadur, mehwish_hayat, pg, 94, [netflix], [animation, adventure, family]).
movie(_3_bahadur_the_revenge_of_baba_balaam, mehwish_hayat, pg, 105, [prime], [animation, adventure, family]).
movie(dillagi, mehwish_hayat, pg13, 140, [prime], [drama, romance]).
movie(wrong_no, mehwish_hayat, pg13, 133, [prime], [comedy, drama]).
movie(bachana, mehwish_hayat, pg13, 118, [netflix], [action, comedy, romance]).
movie(punjabi_nahi_jaungi, mehwish_hayat, pg13, 158, [netflix], [comedy, drama, romance]).
movie(na_maloom_afraad, mehwish_hayat, pg13, 137, [netflix], [comedy, thriller]).
movie(na_maloom_afraad_2, mehwish_hayat, pg13, 135, [netflix], [comedy, drama]).
movie(insha_allah, mehwish_hayat, pg13, 150, [prime], [drama, romance]).
movie(miratu, mehwish_hayat, pg13, 148, [prime], [drama]).
movie(janbaaz, mehwish_hayat, pg13, 136, [prime], [action, thriller]).
movie(mann_mayal, mehwish_hayat, pg13, 142, [prime], [drama, romance]).

movie(teefa_in_trouble, maya_ali, pg13, 155, [netflix], [action, comedy, romance]).
movie(parey_hut_love, maya_ali, pg13, 136, [prime], [comedy, drama, romance]).
movie(mann_mayal, maya_ali, pg13, 142, [prime], [drama, romance]).
movie(sanam, maya_ali, pg13, 144, [prime], [drama, romance]).
movie(diyar_e_dil, maya_ali, pg13, 147, [prime], [drama, romance]).
movie(jaanam, maya_ali, pg13, 138, [prime], [drama, romance]).
movie(miratu, maya_ali, pg13, 150, [prime], [drama, romance]).
movie(aik_nayi_cinderella, maya_ali, pg13, 140, [prime], [comedy, drama, romance]).
movie(zid, maya_ali, pg13, 143, [prime], [drama, thriller]).

movie(wrong_no, danish_taimoor, pg13, 133, [prime], [comedy, drama, romance]).
movie(mera_inam, danish_taimoor, pg13, 128, [prime], [drama]).
movie(jalaibee, danish_taimoor, pg13, 117, [prime], [action, crime, thriller]).
movie(zeher_e_ishq, danish_taimoor, pg13, 136, [prime], [drama, romance]).
movie(wrong_no_2, danish_taimoor, pg13, 135, [prime], [comedy, drama, romance]).
movie(meherposh, danish_taimoor, pg13, 142, [prime], [drama, romance]).
movie(abdullah_the_final_witness, danish_taimoor, pg13, 122, [prime], [drama, thriller]).

movie(na_maloom_afraad, javaid_sheikh, pg13, 137, [netflix], [comedy, thriller]).
movie(jawani_phir_nahi_ani, javaid_sheikh, pg13, 156, [netflix], [comedy, drama, romance]).
movie(wrong_no, javaid_sheikh, pg13, 133, [prime], [comedy, drama, romance]).
movie(yalgaar, javaid_sheikh, pg13, 157, [prime], [action, drama, war]).
movie(om_shanti_om, javaid_sheikh, pg13, 162, [prime], [comedy, drama, romance]).
movie(na_maloom_afraad_2, javaid_sheikh, pg13, 118, [netflix], [comedy, crime, thriller]).
movie(zee_news, javaid_sheikh, pg13, 145, [prime], [drama]).
movie(money_back_guarantee, javaid_sheikh, pg13, 130, [prime], [comedy, drama, crime]).
movie(teefa_in_trouble, javaid_sheikh, pg13, 155, [netflix], [action, comedy, romance]).
movie(happy_bhag_jayegi, javaid_sheikh, pg13, 126, [prime], [comedy, romance]).
movie(tere_naal_love_ho_gaya, javaid_sheikh, pg13, 130, [prime], [comedy, romance]).
movie(jhoom_barabar_jhoom, javaid_sheikh, pg13, 138, [prime], [comedy, drama, romance]).
movie(kuch_luv_jaisaa, javaid_sheikh, pg13, 127, [prime], [drama, romance]).

movie(jawani_phir_nahi_ani_2, ahmed_ali_butt, pg13, 165, [netflix], [comedy, drama]).
movie(jawani_phir_nahi_ani, ahmed_ali_butt, pg13, 156, [netflix], [comedy, drama, romance]).
movie(balu_mahi, ahmed_ali_butt, pg13, 150, [netflix], [comedy, drama, romance]).
movie(tere_bin_laden, ahmed_ali_butt, pg13, 98, [prime], [comedy, drama]).
movie(yalgaar, ahmed_ali_butt, pg13, 157, [prime], [action, drama, war]).
movie(dobara_phir_se, ahmed_ali_butt, pg13, 126, [prime], [drama, romance]).
movie(teefa_in_trouble, ahmed_ali_butt, pg13, 155, [netflix], [action, comedy, romance]).
movie(money_back_guarantee, ahmed_ali_butt, pg13, 130, [prime], [comedy, drama, crime]).
movie(jawani_phir_nahi_ani_2, ahmed_ali_butt, pg13, 165, [netflix], [comedy, drama]).
movie(na_maloom_afraad, ahmed_ali_butt, pg13, 137, [netflix], [comedy, thriller]).

