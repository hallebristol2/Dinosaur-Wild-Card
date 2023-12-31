% Programming Challenge: Wild Card Microworld
% -------------------------------------------------------------
% (1) Sketch an image of what I have chosen to model
% (2) Craft a corresponding KB
% (3) Translate the Prolog KB to an English KB
% (4) Perform a Prolog demo
% (5) Craft an augmentation of the Prolog demo with annotations




% Notes...
% -------------------------------------------------------------
% diet: carnivore,omnivore,herbivore,filterfeeder
% crest: present,absent
% period: triassic,jurassic,cretaceous
% dinosaur: genus,period,diet,crest
% pterosaur: genus,period,diet,crest
% reptile: dinosaur,pterosaur
%
% dinosaurs: eoraptor(triassic,omnivore,absent),
%   styracosaurus(cretaceous,herbivore,present)
% pterosaurs: pterodaustro(cretaceous,filterfeeder,absent),
%   pterodactylus(jurassic,carnivore,present)




% Predicates based directly on FACTS...
% -------------------------------------------------------------
% eoraptor(period(P),diet(D),crest(C)) :: this dinosaur lived
%   in the period P, has a diet D, and either has a crest (present)
%   or does not(absent), denoted by H
dinosaur(genus(eoraptor),
         period(triassic),
         diet(omnivore),
         crest(absent)).
dinosaur(genus(styracosaurus),
         period(cretaceous),
         diet(herbivore),
         crest(present)).
pterosaur(genus(pterodaustro),
          period(cretaceous),
          diet(filterfeeder),
          crest(absent)).
pterosaur(genus(pterodactylus),
          period(jurassic),
          diet(carnivore),
          crest(present)).




%Predicates based on Rules (indirectly on FACTS)...
% -------------------------------------------------------------
%Rules for listing dinosaurs, pterosaurs, and reptiles...
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
%dinosaurs :: all those listed items are dinosaurs
dinosaurs :- dinosaur(Genus,_,_,_),write(Genus),nl,fail.
dinosaurs.


%pterosaurs :: all those listed items are pterosaurs
pterosaurs :- pterosaur(Genus,_,_,_),write(Genus),nl,fail.
pterosaurs.


%reptiles :: all those listed are reptiles
reptiles :- dinosaurs,pterosaurs.


%Rules for finding special reptiles...
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
%jurassic(Genus) :: Genus existed in the Jurassic period
jurassic(Genus) :- dinosaur(Genus,period(jurassic),Diet,Crest).
jurassic(Genus) :- pterosaur(Genus,period(jurassic),Diet,Crest).


%triassic(Genus) :: Genus existed in the Triassic period
triassic(Genus) :- dinosaur(Genus,period(triassic),Diet,Crest).
triassic(Genus) :- pterosaur(Genus,period(triassic),Diet,Crest).


%cretaceous(Genus) :: Genus existed in the cretaceous period
cretaceous(Genius) :- dinosaur(Genus,period(cretaceous),Diet,Crest).
cretaceous(Genius) :- pterosaur(Genus,period(cretaceous),Diet,Crest).


%carnivore(Genus) :: Genus adopted a carnivorous diet
%herbivore(Genus) :: Genus adopted a herbivorous diet
%omnivore(Genus) :: Genus adopted a omnivorous diet
%filterfeeder(Genus) :: Genus adopted a filterfeeding diet
%
%crest_present(Genus) :: Genus has a crest
%crest_absent(Genus) :: Genus does not have a crest