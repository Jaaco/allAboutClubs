allaboutapps hiring project by Jacob Aschenwald

Hier ist eine kurze Übersicht über den Coding-Prozess:

Zuerst habe ich mir einen kurzen Plan gemacht, wie die App aussehen soll, und welche grobe Struktur sich dafür am Besten eignen würde.
Zu Beginn habe ich gleich die Klasse "Club" erstellt, die die Daten von der zur Verfügung gestellten UI als Klasse verfügbar macht.
Dann habe ich die UI von der Startseite erstellt, zuerst mit einer "dummy-data" Liste der "Club" Klasse.
Dann habe ich die Klassen "ClubProvider" und "ClubApi" erstellt.
In "ClubApi" habe ich den http call zu der Api integriert. Es ist wichtig, für das eine eigene Klasse zu haben, um später nur einen zentralen Ort für Änderungen zu haben, falls sich die Api ändert oder man eine andere Api verwenden möchte.
Die Klasse "ClubProvider" ist für das State Management dieser App verantwortlich und dient als Schnittstelle zwischen dem User-Interface und den Api-Daten-Klassen.
"ClubProvider" ist auch dafür verantwortlich, dass keine Daten an das UI gegeben werden die Fehlerhaft sind. Die Klasse hat einen bool-Wert der dem UI sagt, ob man eine Antwort vom Server bekommen hat.
Dieser Wert baut dann im UI je nachdem entweder die Liste mit den Daten, oder einen Fehler für "keine Internetverbindung".
Auch das sortieren der Daten wird vom Provider per Methode "sortClubs" übernommen.


Die Entwicklung dieser App hat für mich 2-2.5h gedauert.
Den Großteil der App (UI, Provider und Services) habe ich in ungefähr 1.5h fertig gehabt.
Die Lokalisierungen für Deutsch und Englisch haben dann noch in etwa eine halbe Stunde in Anspruch genommen. Hier war der hauptsächliche Aufwand Richtext mit den Lokalisierungen gleichzeitig zu verwenden, um den Titel mit einem FontWeight.bold anzuzeigen. Durch das musste man leider den Text bei den Lokalisierungen und in dem UI in etliche Teile aufteilen. Auch Einzahl und Mehrzahl der Siege und ähnliche sachen wie "aus den Niederlanden" statt "aus Niederlande" war durch die Verwengung von Lokalisierungen ein bisschen aufwendiger als sonst, aber kein großes Problem.

Ein weiteres Problem war, dass die Umlaute in der App nicht angezeigt werden konnten. Die Suche diese Problems hat mich auch ungefähr 15 Minuten gekostet, bevor ich gemerkt habe, dass das Problem beim debodieren der JSON datei lag. Hier fand ich dann nach kurzer Suche aber die Lösung:
json.decode(utf8.decode(response.bodyBytes)); mit "utf8" und "response.bodyBytes" konnte ich dann die Daten richtig einlesen.

Ansonsten verlief das Coden sehr fehlerfrei und schnell. (Ich kann leider kein Polnisch, das müsste man noch implementieren.)

Ich habe probiert, mich in der ganzen App an ein einheitlichs Struktur- und Benennungskonzept zu halten und hoffe, dass meine Lösung gut nachvollziehbar ist. Ich habe alle Code-Blocks mit "const" gekennzeichnet um die Performance so weit als möglich optimieren.
Die App habe ich in einem Android Emulator getestet.

Ich hatte sehr Spaß bei diesem Projekt und finde, dass es eine interessante Coding Challenge ist, in viele Konzepte wie Api-Calls, State Management, Routing, ListViews, eine eigene Datenklasse und Text Formatierung und Lokalisierung getestet werden.

Vielen Dank, dass Sie sich die Zeit genommen haben, meine Lösung zu testen und ich stehe für etwaige Fragen jederzeit bereit.
