SET
	SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";

SET
	AUTOCOMMIT = 0;

START TRANSACTION;

SET
	time_zone = "+00:00";

--
-- Base de datos: `tiempomaya`
--
DROP DATABASE IF EXISTS `tiempomaya`;

CREATE DATABASE `tiempomaya` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP DATABASE IF EXISTS `tiempomaya`;
CREATE DATABASE  IF NOT EXISTS `tiempomaya` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `tiempomaya`;

-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `categoria`
--
CREATE TABLE IF NOT EXISTS `categoria` (
	`nombre` varchar(100) NOT NULL,
	PRIMARY KEY (`nombre`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--
-- Volcado de datos para la tabla `categoria`
--
INSERT INTO
	`categoria` (`nombre`)
VALUES
	('Calendario Cholquij'),
	('Calendario Haab'),
	('Clasico'),
	('Energia'),
	('Energia_1'),
	('Energia_10'),
	('Energia_11'),
	('Energia_12'),
	('Energia_13'),
	('Energia_2'),
	('Energia_3'),
	('Energia_4'),
	('Energia_5'),
	('Energia_6'),
	('Energia_7'),
	('Energia_8'),
	('Energia_9'),
	('Escritura1'),
	('Kin_0'),
	('Kin_1'),
	('Kin_10'),
	('Kin_11'),
	('Kin_12'),
	('Kin_13'),
	('Kin_14'),
	('Kin_15'),
	('Kin_16'),
	('Kin_17'),
	('Kin_18'),
	('Kin_19'),
	('Kin_2'),
	('Kin_3'),
	('Kin_4'),
	('Kin_5'),
	('Kin_6'),
	('Kin_7'),
	('Kin_8'),
	('Kin_9'),
	('Nahual'),
	('Nahual_0'),
	('Nahual_1'),
	('Nahual_10'),
	('Nahual_11'),
	('Nahual_12'),
	('Nahual_13'),
	('Nahual_14'),
	('Nahual_15'),
	('Nahual_16'),
	('Nahual_17'),
	('Nahual_18'),
	('Nahual_19'),
	('Nahual_2'),
	('Nahual_3'),
	('Nahual_4'),
	('Nahual_5'),
	('Nahual_6'),
	('Nahual_7'),
	('Nahual_8'),
	('Nahual_9'),
	('PosClasico'),
	('PreClasico'),
	('Rueda Calendarica'),
	('Uinal'),
	('Uinal_0'),
	('Uinal_1'),
	('Uinal_10'),
	('Uinal_11'),
	('Uinal_12'),
	('Uinal_13'),
	('Uinal_14'),
	('Uinal_15'),
	('Uinal_16'),
	('Uinal_17'),
	('Uinal_18'),
	('Uinal_2'),
	('Uinal_3'),
	('Uinal_4'),
	('Uinal_5'),
	('Uinal_6'),
	('Uinal_7'),
	('Uinal_8'),
	('Uinal_9');

-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `energia`
--
CREATE TABLE IF NOT EXISTS `energia` (
	`id` int(11) NOT NULL,
	`nombre` varchar(25) NOT NULL,
	`significado` tinytext NOT NULL,
	`htmlCodigo` mediumtext NOT NULL,
	`nombreYucateco` varchar(30) NOT NULL,
	`categoria` varchar(100) NOT NULL,
	PRIMARY KEY (`id`),
	KEY `fk_energia_categoria1_idx` (`categoria`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--
-- Volcado de datos para la tabla `energia`
--
INSERT INTO
	`energia` (
		`id`,
		`nombre`,
		`significado`,
		`htmlCodigo`,
		`nombreYucateco`,
		`categoria`
	)
VALUES
	(
		1,
		'Jun',
		'El Todo, La Unidad, El Absoluto, La Pureza',
		'Principio de Unidad.<br><span></span>Propósito, Atraer, Unificar.<br><span></span>El principio y origen, el ser humano como un todo.<br><span></span>La unidad establece el propósito, el objeto y la meta de acción por pequeña que esta sea.<br><span></span>La unidad es el todo, la única verdad absoluta, es la creación mental del todo.<br><span></span>En el circulo de la perfección todos los seres están unidos inseparablemente sin importar su dimensión de manifestación, la creencia de que no es así, crea una grieta en la relación original y esa grieta en el campo de energía crea una polaridad (como proceso de cicatrización) que ha de convertirse en vibración.',
		'Jun',
		'Energia_1'
	),
	(
		2,
		'Keb\'',
		'La Pareja, La Polaridad, El Complemento, El Apoyo',
		'Principio de Polaridad.<br><span></span>Desafió, Estabilizar, Polarizar.<br><span></span>Esqueleto y esencia, Masculino y femenino; forman el principio generador dual, la simetría dual de los seres. Son los extremos de un mismo fenómeno, opuestos idénticos en su naturaleza: espíritu y materia, luz y oscuridad, yin y yang.<br><span></span>Armonizar la vibración es resolver la polaridad equilibrando los dos extremos, o sea, incluyéndolos<br><span></span>Si todo es luz, las formas se difuminan, por eso es necesario el contraste de las sombras.<br><span></span>Cultivar nuestra resonancia es armonizar nuestra vibración con resonancias superiores como la planetaria, solar y galáctica.',
		'Ka\'a',
		'Energia_2'
	),
	(
		3,
		'Oxib\'',
		'Los Resultados, Los Hijos, El Temor, Los Frutos',
		'Principio del ritmo o compensación.<br><span></span>Servicio, Unir, Activar.<br><span></span>Flujo y reflujo, ascenso y descenso, acción y relación; es el movimiento entre los polos de todos los planos (físico, mental y espiritual).<br><span></span>Cada fenómeno, cada proceso tiene su propio ritmo: todo tiene un inicio, nace, crece, muere y renace. Liquido precioso que da calor y energía al cuerpo, sangre, el agua de la naturaleza, lluvia.<br><span></span>Al crear polaridades, desencadenamos eventos, circunstancias que experimentamos y superamos, las acciones que producen un campo de negatividad (ignorancia, oscuridad espiritual) son kharmas, las acciones que suprimen y corrigen la negatividad (sabiduría) son Dharmas y crean un campo benéfico.',
		'Ox',
		'Energia_3'
	),
	(
		4,
		'Kajib\'',
		'La Solidez, La Fortaleza, La Felicidad, La Estabilidad',
		'Principio de la medida.<br><span></span>Forma, Medir, Definir.<br><span></span>El cuatro como medida de todas las estructuras materiales (la pirámide), entra siempre en relación con la composición trina de lo espiritual, formando la estructura Septernal de todo lo que Es.<br><span></span>El poder del ordenamiento matemático del macro y microcosmos. Todo cuanto existe es según la medida de la ley del todo.<br><span></span>Establece los limites de las estructuras; las 4 fuerzas principales, 4 rumbos sagrados, 4 elementos: calor, viento y agua sobre tierra. Cuatro son las regiones mayas, 4 los elementales, 4 los nucleótidos, 4 los elementos químicos primarios, 4 las razas cósmicas, rumbos cardinales, estaciones solares, chacras de personalidad, etc',
		'Kan',
		'Energia_4'
	),
	(
		5,
		'Job\'',
		'El Amor, El Trabajo, El Esfuerzo, Analizar',
		'Principio de lo nuclear.<br><span></span>Esplendor, Mandar, Dar poder.<br><span></span>La capacidad de realización, la movilidad de los dedos, percibir la belleza de la naturaleza, el 5to. punto o centro del Universo.<br><span></span>Toda unidad, por pequeña que sea, objetiva o subjetiva comporta un núcleo como atractor y una periferia de manifestación (núcleo del átomo y electrones, por ejemplo).<br><span></span>Deriva la concepción del matiz cromático de cinco, que es la acción de la quinta fuerza galáctica; el matiz del color da la entonación.',
		'Jo',
		'Energia_5'
	),
	(
		6,
		'Waqib\'',
		'El Mundo Material, La Materia, La Amistad, La Reacción',
		'Principio del equilibrio orgánico: 2x3. (Polaridad por ritmo)<br><span></span>Igualdad, Equilibrar, Organizo.<br><span></span>La polaridad del ritmo genera el principio orgánico, la ley del ordenamiento Hexagonal de las estructuras cristalinas y celulares. La tendencia de las estructuras ligadas al proceso de la vida es la de alcanzar el equilibrio relativo, estado de realización intermedio, a partir del cual continuar el movimiento hacia la conciencia superior.<br><span></span>El principio del Diferencial de Potencial aporta la resolución de situaciones a través de saltos cualitativos entre estados de la energía. Nada de cuanto sucede es casual, todo esta sujeto al poder de la ley primigenia; todo efecto tiene su causa y a la vez es causal de otros efectos, la Causa Centro Primera es el Creador.<br><span></span>Su acción es equilibrar, el principio de la integración de nuestra introspección',
		'Wak',
		'Energia_6'
	),
	(
		7,
		'Wuqub\'',
		'El Equilibrio, El Movimiento, El Integrar, El Realizar',
		'Principio de unificación mental. (Poder místico)<br><span></span>Armonización, Inspirar, Canalizo.<br><span></span>Los hombres somos unidades resonantes dentro de un todo Mental, el orden material es un fractal del ordenamiento mental del universo; nosotros no controlamos la mente, somos pensados por la mente, vivimos inmersos en ella.<br><span></span>El siete canaliza energía inspirando la armonización. Representa las fases lunares de 7 días, el segundo paso de la transformación interior; el intelecto activo, inquieto, la influencia lunar.',
		'Uuk',
		'Energia_7'
	),
	(
		8,
		'Wajxaqib\'',
		'La Espiritualidad, El Arte, La Alegría, La Energía Masculina',
		'Principio de Resonancia armónica. (Octavas resonantes)<br><span></span>Integridad, Modelar, Armonizar.<br><span></span>Así como en música, las escalas se suceden en octavas, las energías vibratorias contactan y resuenan con sus respectivas equisonantes en los niveles superiores e inferiores de manifestación, como también con los armónicos secundarios derivados de la vibración.<br><span></span>Las octavas son el vehículo de información del todo, como ley de la armonía; el tono ocho otorga la habilidad de dar forma, de modelar, de describir aspectos del nivel inmediatamente superior de vibración.<br><span></span>Ocho es la esencia interior, el ser como recipiente de la esencia cósmica, el 2 veces NAHUI (4), conjuga las 4 direcciones (+) y los 4 rincones (X) del mundo.',
		'Waxac',
		'Energia_8'
	),
	(
		9,
		'B\'elejeb\'',
		'La Realización, El Poder, Acción, La Energía Femenina',
		'Principio de la Periodicidad cíclica.<br><span></span>Intención, Realizar, Pulso.<br><span></span>Todo cuanto se mueve lo hace de acuerdo a la Ley Cósmica; la periodicidad cíclica, no la repetición de los sucesos, es la cualidad por la que un evento se asocia a otros anteriores y posteriores en el tiempo como fenómenos resonantes (ciclos entre ciclos).<br><span></span>Representa lo femenino del principio generatriz (Yin), el polo creativo en el cual se manifiesta la generación o producción de formas, energías y conceptos nuevos dinamizadores del proceso evolutivo de la vida, el objetivo; la intención de poner la acción en movimiento',
		'Bolon',
		'Energia_9'
	),
	(
		10,
		'Lajuj',
		'La Ley, La Autoridad, La Rectitud, La Impecabilidad',
		'Principio de la Manifestación.<br><span></span>Manifestar, Producir, Perfecciono.<br><span></span>El movimiento como energía se manifiesta en cada nivel u octava de vibración (dimensión); todo lo que se manifiesta, es decir, que cobra presencia (objetiva o subjetiva) se puede medir y viceversa.<br><span></span>La manifestación de la energía en todos los planos, implica vencer o enfrentar los obstáculos inherentes al plano dimensional y al tipo de presencia a manifestarse. Las manos juntas, la dualidad de las manos (5+5=10), equilibrándose mutuamente, como flecha al objetivo.',
		'Lajun',
		'Energia_10'
	),
	(
		11,
		'Julajuj',
		'Compartir, Separar, Las Posibilidades, Dejarse-abandonarse',
		'Principio de las Estructuras disonantes.<br><span></span>Liberación, Divulgar, Disolver.<br><span></span>Todas las estructuras, cualquiera sea su naturaleza, tienden a ingresar a nuevas realidades; el movimiento perpetuo implica mutación y cambio constante, en la vida vamos haciendo conscientes estas nuevas realidades.<br><span></span>Las estructuras que se \"desordenan\" como un aparente caos para el mundo material, en realidad están ingresando a otro orden superior no comprensible desde la tridimensional. La grieta que nos escinde del todo es la no evolución, nuestra tendencia a quedarnos resguardados donde nos sentimos cómodos y seguros es un espejismo; un orden superior que hoy asimilamos como caos esta a la espera de nuestro ingreso, es la quinta dimensión que trasciende a las anteriores',
		'Buluk',
		'Energia_11'
	),
	(
		12,
		'Kab\'lajuj',
		'La Familia, La Comunidad, Los Grupos, La Seguridad',
		'Principio de la Estabilidad compleja: 2x6.<br><span></span>Cooperación, Universalizar, Dedicación.<br><span></span>Es la polarización del equilibrio orgánico, mediante el cual cada especie gana su propio nivel de frecuencia armónica, es decir, su estatuto como especie: código, nicho, hábitat, etc. Genera las fuerzas conservacionistas de los organismos vivos, incluida la tierra, como cooperación simbiotica.',
		'Kaalajun',
		'Energia_12'
	),
	(
		13,
		'Oxlajuj\'',
		'La Magia, EL Poder del Camino, La Teurgia, El Trasmutar',
		'Principio del movimiento universal o principio de vibración.<br><span></span>Presencia, Trascender, Perdurar.<br><span></span>Todo cuanto existe esta en perpetuo movimiento, desde lo mas sutil con las vibraciones, hasta lo mas denso y pesado como expresión de las bajas frecuencias, a tal punto que estos extremos parecen en reposo. <br><span></span>El movimiento es la energía que fluye desde la fuente y regresa a ella. Este principio otorga trascendencia a todo lo que funciona con y obedece a la ley del uno, trascendencia es la cualidad de perdurar mas allá del tiempo y del espacio. La unión total de todos los números anteriores, el ultimo numero representa el conocimiento interno, la introspección, centralidad y transparencia, Sabiduría del Universo, La Madre Tierra, respeto a lo que existe, florece y da frutos.',
		'Oxlajun',
		'Energia_13'
	);

-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `kin`
--
CREATE TABLE IF NOT EXISTS `kin` (
	`id` int(11) NOT NULL,
	`iddesk` int(11) NOT NULL,
	`nombre` varchar(25) DEFAULT NULL,
	`significado` varchar(150) DEFAULT NULL,
	`htmlCodigo` mediumtext,
	`categoria` varchar(100) NOT NULL,
	`nombreYucateco` varchar(25) DEFAULT NULL,
	PRIMARY KEY (`id`),
	KEY `fk_kin_categoria1_idx` (`categoria`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--
-- Volcado de datos para la tabla `kin`
--
INSERT INTO
	`kin` (
		`id`,
		`iddesk`,
		`nombre`,
		`significado`,
		`htmlCodigo`,
		`categoria`,
		`nombreYucateco`
	)
VALUES
	(
		0,
		1,
		'Imix\'',
		'Dragon',
		'Es el guardián fiero de la vida, de las ideas y proyectos que pone en marcha. Es el gestor, el productor, el iniciador. Goza de una gran sensibilidad existencial y una creatividad única. Si no está en armonía consigo mismo puede tener muchas ideas pero no realizar ninguna por no saber por dónde empezar o también dedicarse a tantos proyectos al mismo tiempo que no logra entregarse por entero a ninguno. Dejar lo que empiece sin terminar lo retrasa energéticamente. Espiritualmente representa la memoria ancestral y si está despierto logra integrarla en todo lo que hace.',
		'Kin_0',
		'Imix'
	),
	(
		1,
		2,
		'Ik\'',
		'Viento',
		'Es la comunicación, el aliento divino, la flexibilidad y el cambio. Tiene el don de la palabra, así que deberá usarla estratégicamente y con bondad. Necesita de novedades todo el tiempo, suele ser sumamente social aunque en sombra puede guardar mucho de sí mismo aún rodeado de gente y hablando sin decir nada. A nivel espiritual puede canalizar mensajes del más allá. Necesita focalizarse y decir todo lo que siente en lo más profundo de sí, sabiendo también cuándo guardar silencio. ',
		'Kin_1',
		'Ik'
	),
	(
		2,
		3,
		'Ak\'bal\'',
		'Noche',
		'Es el sol de la oscuridad. Representa nuestro inconsciente, el mundo onírico y la capacidad de realizar nuestros sueños. Tiene el potencial de recibir mensajes en sueños, solo hay que hacerles caso. Necesita descansar mucho y estar solo por periodos. Es importante saber salir también y relacionarse con el mundo, con la espontaneidad que la caracteriza. Suelen ser histriónicos, sumamente intuitivos y más bien estancar su abundancia si no creen en sí mismos. Es importante estar atento a las posibles locuras, impulsividades,  deseos sin resolver, y a un ego desmedido, para poder equilibrarse.',
		'Kin_2',
		'Akbal'
	),
	(
		3,
		4,
		'K\'an',
		'La Semilla',
		'Es la capacidad de inyectarle vida a todo lo que nos propongamos para que florezca, para que tenga resultados, para que se materialice y sea exitoso. En primer lugar la Semilla debe sentir, identificar sus pasiones, aquello que ama hacer, para que pueda dedicarse a eso y no desbalancearse entregando toda su infinita energía en proyectos ajenos o en aquellos a los que se ha acostumbrado por presión social o solo porque funcionan. También es la danza, el gozo, el placer, la curiosidad y el saber atinar, saber esperar al momento correcto para actuar',
		'Kin_3',
		'Kan'
	),
	(
		4,
		5,
		'Chikchan',
		'La Serpiente',
		'Es la fuerza vital, la astucia para vivir en el mundo material, así como la sabiduría para entender que no hay espiritualidad sin equilibrio físico. La Serpiente se dedica a reunir los recursos necesarios para tener una buena vida, en sombra ese será su único objetivo, en luz, sabrá que ese es solo el medio para poder evolucionar a este plano. Suele ser dominante, territorial y austera, pero también muy culta y noble.',
		'Kin_4',
		'Chicchan'
	),
	(
		5,
		6,
		'Kimi',
		'El enlazador de mundos',
		'Es el puente entre diferentes dimensiones. En este plano domina la capacidad de ser como un relacionista público, de crear contactos, de saber cómo relacionarse con los demás para generar redes y oportunidades. En el plano espiritual es el mensajero de los espíritus y, aunque lo suela bloquear por miedo, puede recibir información para sí mismo o para ser transmitida a los demás como forma de ayuda. Su  misión es entender la muerte como parte de la vida, profundizar en su conocimiento espiritual sobre la misma para saber dejar ir cuando corresponda.',
		'Kin_5',
		'Cimi'
	),
	(
		6,
		7,
		'Manik\'',
		'La mano',
		'Representa el servicio, la sanación y la realización. Es el poder de llevar a cabo todo lo que uno se proponga. En sombra, la Mano hace por hacer, es adicto al trabajo, pero no se arriesga a dedicarse a lo que más sueña. En luz, todo lo que haga además estará conectado con su capacidad de ayudar y de sanar. Debe tener mucho cuidado con control y aprender a poner límites sanos entre lo que le da a los demás y a sí mismo.',
		'Kin_6',
		'Manik'
	),
	(
		7,
		8,
		'Lamat',
		'La estrella',
		'Representa el arte, la belleza, la elegancia, la armonía, la creatividad, pero también el pensamiento abstracto, el mundo de las ideas y la producción intelectual. Las personas Estrella gozan hasta de un garbo natural, y si bien su misión es desarrollar su gran creatividad pueden perderse fácilmente en el plano racional. En sombra buscan el perfeccionismo, dañando su sistema nervioso. En luz pueden llegar a ser grandes y virtuosos artistas. Es importante que dejen la terquedad de lado, la necesidad de relativizarlo todo y de querer encontrar la verdad en la mente conceptual.',
		'Kin_7',
		'Lamat'
	),
	(
		8,
		9,
		'Muluk',
		'La luna',
		'Es el mundo de las emociones. La Luna lo siente todo, su sensibilidad es vasta y todo le impacta profundamente. De hecho es capaz de saber cómo se siente cada persona a su alrededor, tendiendo a querer acobijar a todo el que sufra. Esto puede traerle muchos problemas ya que se cargará de cosas que no le corresponden. En este sentido goza de una poderosa intuición y de una gran imaginación. Representa la energía de lo femenino, el poder de las aguas y la maestría en relación a los elementos de la naturaleza. Necesita trascender el drama ahí donde lo ve, purificarse de todo lo que sienta y dejarse fluir.',
		'Kin_8',
		'Muluc'
	),
	(
		9,
		10,
		'Ok',
		'El perro',
		'Es la energía del amor incondicional. El Perro representa la fidelidad, la lealtad y el compañerismo, es el guardián de sus seres queridos. En sombra tiene problemas de autoestima, dando siempre demás a quienes no le corresponden y exigiendo en consecuencia. En luz es capaz del máximo altruismo, sabiéndose amar a sí mismo primero, poniendo límites sanos a todo lo que no le haga bien en sus relaciones afectivas y amando sin aprehensión. Tenderá a dedicarse de alguna u otra manera a proyectos sociales, a hacer el bien por la humanidad. En este sentido tendría que tener cuidado con inconscientemente actuar como el salvador de los demás.',
		'Kin_9',
		'Oc'
	),
	(
		10,
		11,
		'Chuwen',
		'El mono',
		'Es el niño interior que con su sabiduría ilumina la vida de los demás. En luz es el sentido del humor, lo lúdico, la irreverencia que cuestiona todo como jugando. En sombra suele tender a tomarse todo demasiado en serio y actuar como el abogado defensor de las causas justas. No se permite relajarse y guarda situaciones de la infancia por resolver. Su misión será mostrarle al mundo que nada es tan sólido como parece y que a veces es necesario confrontarnos desde la risa para lograr soltar el ego.',
		'Kin_10',
		'Chuen'
	),
	(
		11,
		12,
		'Eb\'',
		'El humano',
		'Representa el más alto estándar de integridad. Es el sabio que defiende las causas justas, habitualmente sacrificándose en el proceso. En luz está en conexión profunda con su libertad y sabrá equilibrar su gran necesidad de generar armonía alrededor suyo con el camino que quiera elegir. En sombra, se pospondrá por el resto o caerá en la indecisión aguda de no saber qué decisiones tomar, por tener un concepto rígido del deber ser.',
		'Kin_11',
		'Eb'
	),
	(
		12,
		13,
		'B\'en',
		'El caminante del cielo',
		'Es el explorador, el buscador del sentido último de la existencia. Su principal motivación es conocer, conocerlo todo, sobre todo otras culturas, otros territorios, otros saberes, otras idiosincrasias. En luz, sabrá dejarse guiar por su intuición y todo lo que conozca logrará transformarlo, para luego compartirlo con el mundo. En sombra, el escepticismo le jugará malas pasadas, y solo buscará que conocer hacia fuera, sin tener el coraje de viajar dentro suyo ni de encontrar un camino espiritual.',
		'Kin_12',
		'Ben'
	),
	(
		13,
		14,
		'Ix',
		'El mago',
		'Es el que con su encanto natural logra transformarlo todo. Artista, performer, alquimista, sanador, brujo, ingeniero, consejero, orador. En luz, podrá cumplir con su misión de ser fuente de inspiración para los seres humanos, en sombra la soberbia lo llevará a preocuparse solo por la valoración externa, por los aplausos.',
		'Kin_13',
		'Ix'
	),
	(
		14,
		15,
		'Men',
		'El aguila',
		'Representa la visión panorámica, la agudeza analítica y la creatividad de vanguardia. Es visionaria y muy profunda, sintiéndose siempre responsable del bienestar ajeno. En luz logrará creer en sí misma para emprender el vuelo y evolucionar, en sombra se quedará procastinando distrayéndose con todo lo que su mente es capaz de vislumbrar, y poniendo el bien común adelante de sus prioridades como pretexto.',
		'Kin_14',
		'Men'
	),
	(
		15,
		16,
		'Kib\'',
		'El guerrero',
		'Es el samurai, el que con disciplina y entrega se entrena para ir a la batalla a ganar. Pero la batalla no es el conflicto, es la posibilidad de transformar la realidad, aquello que es injusto, de manera estratégica, intrépida, frontal y sobre todo humilde. Un Guerrero en sombra lo cuestiona todo solo por ego, incluso a sí mismo, autoboicoteándose. En luz es el maestro espiritual, perfil bajo, que ilumina con sus acciones.',
		'Kin_15',
		'Cib'
	),
	(
		16,
		17,
		'Kab\'an',
		'La tierra',
		'Representa la estabilidad suprema. Es la dadora de base, de estructura, tanto en el plano físico como en el emocional, psíquico o espiritual. Suelen ser personas bastante fuertes que logran impulsar, con su gran empuje, a que se genere aquello que hace falta para salir adelante. En sombra caen en la sobre interpretación, en ser retadoras, creando argumentos solo para validar aquello con lo que se han entercado. En luz, saben que la verdadera estabilidad es fluir con lo que la realidad les propone, sin presionar, sin recurrir a la fuerza.',
		'Kin_16',
		'Caban'
	),
	(
		17,
		18,
		'Etz\'anab\'',
		'El espejo',
		'Es el equilibrio perfecto, la ecuanimidad, la paz interior que brota gracias a una verdadera aceptación de todo tal y como es. En luz el Espejo fluye con todo sin filtros ni reparos, generando una gran armonía entre quienes lo rodean. Es uno de los sellos que se suele llevar mejor con la gente. En sombra sin embargo tiende al juicio extremo, no encuentra orden nada, menos en sí mismo, y termina en crisis por criticarlo todo. No es capaz de verse y suele proyectar sus defectos en los demás. En el calendario maya tradicional se le asocia al cuchillo de obsidiana, cualidad espiritual para cortar de raíz con todo lo que no nos sirve en nuestra vida',
		'Kin_17',
		'Etznab'
	),
	(
		18,
		19,
		'Kawak',
		'La tormenta',
		'Es la fuerza transformadora de la realidad. Cuando aparece la tormenta es momento de cambios radicales, no hay de otra. En general es una energía poderosa de creación, suele pasar perfil bajo pero cuando llega el momento se manifiesta con una gran fiereza. En sombra se estacan y no se permiten cambiar, o al revés, generan cierta adicción a los movimientos fuertes permanentes. Pueden también quedarse en la extrema introspección, son muy sensibles, y no mostrarse. En luz logran generar situaciones límites para dejar ir aquello que ya le tocaba irse y poder volver a empezar en un nuevo nivel de evolución.',
		'Kin_18',
		'Cauac'
	),
	(
		19,
		20,
		'Ajaw',
		'El sol',
		'Es la energía de mayor evolución. Representa la luz generadora de vida, la sabiduría, la verdad, las cosas tal y como son. Cuando aparece el Sol es momento de brillar, de confiar en quienes ya somos y en lo que ya sabemos de manera intrínseca, y asumir los roles de autoridad, de liderazgo que nos correspondan. Es momento de afrontar la realidad como se presente, así nos cueste. El problema con el Sol es que al ser la verdad puede tornarse intransigente, radical con la ética, con los paradigmas, con lo que considera correcto o cierto, así, debe trabajar por sobre todas las cosas la humildad. La verdadera sabiduría no se anda mostrando, defendiendo o convenciendo, es un estado del alma, de conexión permanente con nuestro ser auténtico.',
		'Kin_19',
		'Ahau'
	);

-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `nahual`
--
CREATE TABLE IF NOT EXISTS `nahual` (
	`idweb` int(11) NOT NULL,
	`iddesk` int(11) DEFAULT NULL,
	`nombre` varchar(20) NOT NULL,
	`nombreYucateco` varchar(50) DEFAULT NULL,
	`significado` varchar(100) NOT NULL,
	`htmlCodigo` longtext,
	`categoria` varchar(100) NOT NULL,
	`descripcion` mediumtext,
	`rutaEscritorio` varchar(100) DEFAULT NULL,
	PRIMARY KEY (`idweb`),
	UNIQUE KEY `iddesk_UNIQUE` (`iddesk`),
	KEY `fk_nahual_categoria1_idx` (`categoria`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--
-- Volcado de datos para la tabla `nahual`
--
INSERT INTO
	`nahual` (
		`idweb`,
		`iddesk`,
		`nombre`,
		`nombreYucateco`,
		`significado`,
		`htmlCodigo`,
		`categoria`,
		`descripcion`,
		`rutaEscritorio`
	)
VALUES
	(
		0,
		15,
		'Tzikin',
		NULL,
		'Pajaro',
		'<p>\r\n    <strong>Características:</strong>\r\n    Significa pájaro. Es el símbolo de la suerte, la fortuna y los bienes materiales. También es símbolo de libertad y es el nawal de las aves.\r\n  </p>\r\n  <p>\r\n    Simboliza el pájaro sagrado Q’uq’umatz. Este día es propicio para pedir por la abundancia de los bienes como el dinero.\r\n    Se quema el ajonjolí y el chocolate como ofrendas a Ajaw. Se encienden candelas de colmena pura y se le pide a Ajaw un buen negocio.\r\n    Tz’ikin significa pájaro y simboliza la intermediación entre los seres humanos y Ajaw, representado por todo lo que hay en el espacio:\r\n    el aire, las nubes, el frío y el calor. Son fuerzas invisibles, pero que El Corazón del Cielo y El Corazón de la Tierra las ha puesto\r\n    a nuestro servicio y protección.\r\n  </p>\r\n  <p>\r\n    También es un día de desarrollo espiritual y, por tanto, de  la plena realización humana.\r\n    Es el día para agradecer los bienes materiales principalmente lo relacionado a dinero.\r\n    Sin embargo, al no agradecer estos favores también puede traer la miseria.\r\n  </p>\r\n  <p>\r\n    <strong>Función Espiritual:</strong>\r\n  </p>\r\n  <ul>\r\n    <li> Agradecimiento por los bienes materiales, principalmente lo del dinero.</li>\r\n    <li> Propicia buena suerte en el negocio.</li>\r\n    <li> Día de invocación porque las aves no molesten los sembradíos.</li>\r\n    <li> Día para la protección del negocio.</li>\r\n    <li> Día para realizar invocaciones para que las siembras estén protegidas de los animales.</li>\r\n  </ul>\r\n  <p><strong>Su origen:</strong> Kej <strong>destino:</strong> Aq\'ab\'al</p>\r\n  <p>\r\n    <strong>Fortalezas:</strong>\r\n  </p>\r\n  <ul>\r\n    <li> Es bueno para el negocio.</li>\r\n    <li> Es mensajero, paciente y amable.</li>\r\n    <li> De buen temperamento.</li>\r\n    <li> Tiene habilidad para el análisis y es buen observador.</li>\r\n    <li> Desarrolla mejor su inteligencia.</li>\r\n    <li> Puede tener dotes para la predicción de las cosas.</li>\r\n    <li> Puede ser afortunado en lo material.</li>\r\n    <li> Puede tener bien desarrollado la parte espiritual.</li>\r\n  </ul>\r\n  <p>\r\n    <strong>Debilidades:</strong>\r\n  </p>\r\n  <ul>\r\n    <li> Envidia</li>\r\n    <li> Infidelidad</li>\r\n    <li> Avaricia</li>\r\n    <li> Tacañería</li>\r\n    <li> En algún vicio</li>\r\n  </ul>',
		'Nahual_0',
		'Es el Nawal del bienestar económico, la buena fortuna, día propicio para agradecer y pedir el bienestar económico.\nEs la comunicación e intermediación entre Uk´ux Kaj y Uk´ux Ulew, el corazón del cielo y el corazón de la tierra.\nPersonas que construyen su propio bienestar.',
		'src/imagenesNahuales/15.jpg'
	),
	(
		1,
		16,
		'Ajmaq',
		NULL,
		'Búho, falta o culpa',
		'<p>\n    <strong>Características:</strong>\n    Esta palabra significa pecador en K’iche’.  Es el día de los pecadores.  Este día se dedica a pedir perdón por los pecados y por los pecadores.\n    Es el día dedicado a los difuntos.  El pecado es una columna de humo que nos oculta delante de la presencia de Dios.\n    Nuestros antepasados dijeron:  “que el pecado es la ofensa que se hace directamente a Dios.\n    No creer, no servir, no alabar al Corazón del Cielo, al corazón de la Tierra.  Mak es ofensa a Dios y Wuqub’ qak’ix  es ofensa al prójimo”\n  </p>\n  <p>\n    Es el día de los que no podemos ver, el día de los difuntos.  El día de la fortaleza que nos da la historia de nuestro pasado.\n    También es el día del castigo cuando no estamos actuando en concordancia con las enseñanzas que ellos nos legaron.  Es el día del enojo de los difuntos. (BEA)\n  </p>\n  <p>\n    “Ajmaq no es un mal día.  Es un día para pedir perdón por los pecados.\n    Son  los días en los cuales se reza por protección, ya que de estos días puede venirle a uno, daño por sus pecados o sus malos pensamientos.\n  </p>\n  <p>\n    es la muerte en casa, la muerte natural por enfermedad, la muerte tranquila.\n    En ese día se habla con los difuntos, es para pedir perdón en el caso de los pecadores.\n  </p>\n  <p>\n    <strong>Significa:</strong>\n  </p>\n  <ul>\n    <li> Purificar el espíritu de los muertos y vivos.</li>\n    <li> Día para conmemorar los difuntos.</li>\n    <li> Perdón para nuestros pecados.</li>\n  </ul>\n  <p><strong>Significado Clave:</strong> Autoridad y Estatus.</p>\n  <p>\n    <strong>Fortalezas:</strong>\n  </p>\n  <ul>\n    <li> Posee sabiduría, inteligencia</li>\n    <li> Buena memoria</li>\n    <li> Muy valiente</li>\n    <li> Se les facilita el diálogo</li>\n    <li> Prudente, discreto</li>\n    <li> Buenos maestros y consejeros</li>\n    <li> Muy sociable</li>\n    <li> Es profundo</li>\n    <li> Es serio</li>\n    <li> Realista</li>\n    <li> Predicador</li>\n    <li> Comunicativo</li>\n  </ul>\n  <p>\n    <strong>Debilidades:</strong>\n  </p>\n  <ul>\n    <li> Pecador</li>\n    <li> Enamorado</li>\n    <li> Alcohólico</li>\n    <li> Destructores de la herencia</li>\n    <li> Mentirosos</li>\n    <li> Afamados</li>\n    <li> Resentido</li>\n    <li> Ladrón</li>\n    <li> Adúltero</li>\n    <li> Fríos e insensibles</li>\n    <li> Minimizan los sentimientos de los demás</li>\n    <li> Interesados en la autoridad y posición social y política</li>\n  </ul>',
		'Nahual_1',
		'Es el Nawal de todas las faltas, es el día de los abuelos que ya no están (difuntos).\nEs el día para pedir perdón por las faltas.\nPersonas valientes y de sangre dulce que  fácilmente caen en culpas.',
		'src/imagenesNahuales/16.jpg'
	),
	(
		2,
		17,
		'No\'j',
		NULL,
		'Idea o sabiduria',
		'<p>\n    <strong>Características:</strong>\n    Es la sabiduría y el conocimiento. Es el nawal de la inteligencia. Es el buen consejo, según los abuelos y abuelas.\n    Es la sabiduría que viene del Formador y Creador. También es uno de los Cargadores del Tiempo.\n    Día propicio para agradecer el conocimiento y pedir buenos pensamientos.\n  </p>\n  <p>\n    El que nace bajo la influencia del No’j será inteligente, activo y tendrá buenos pensamientos, siempre y cuando sepa manejar las energías del día.\n    Significa también idea y sabiduría. Según los mayas ningún hombre es sabio. Por eso, el hombre, para recibir ideas y consejos,\n    debe consultar al Ajaw por medio del “xukulem” o la ceremonia maya. También puede realizar dichas consultas por medio del tz’ite’,\n    mediante la intermediación del Ajq’ij, para recibir los consejos de los abuelos y abuelas. Dentro de la espiritualidad maya,\n    el hombre tiene ideas pero no sabiduría. Por eso, es importante juntarse en consejo para unir ideas y formar así  una ciencia.\n    Nuestros antepasados se reunían en consejo bajo la protección del No’j.\n  </p>\n  <p>\n    es el día de la sabiduría. Es el día  para tomar decisiones de manera particular o en consejo. Es un día que propicia la planificación de algún proyecto y de los\n    lineamientos a seguir en la conducción de la comunidad y de la sociedad en general. También es el día en que nuestro pensamiento puede tener mayor fluidez.\n  </p>\n  <p>\n    <strong>Función espiritual:</strong>\n  </p>\n  <ul>\n    <li> Agradecer el conocimiento y las ideas.</li>\n    <li> Agradecer la inteligencia.</li>\n    <li> Día para acrecentar la memoria.</li>\n    <li> Agradecer la inteligencia.</li>\n    <li> Día para pedir buenos consejos.</li>\n  </ul>\n  <p><strong>Su origen:</strong> Toj <strong>destino:</strong> Kan</p>\n  <p>\n    <strong>Fortalezas:</strong>\n  </p>\n  <ul>\n    <li> Es poseedor de muchos conocimientos.</li>\n    <li> Es inteligente y es consejero.</li>\n    <li> Puede llegar a ser científico.</li>\n    <li> Es ordenado y creativo.</li>\n    <li> Es justo y humanista.</li>\n    <li> Es buen estudiante.</li>\n    <li> Puede llegar a ser un buen líder.</li>\n  </ul>\n  <p>\n    <strong>Debilidades:</strong>\n  </p>\n  <ul>\n    <li> Puede caer en el orgullo.</li>\n    <li> Se puede enojar con facilidad.</li>\n    <li> Le cuesta tomar decisiones.</li>\n    <li> Puede ser individualista y egoísta.</li>\n  </ul>',
		'Nahual_2',
		'Significa idea, sabiduría.\nEs el Nawal de la inteligencia, día dedicado a pedir la sabiduría, el talento, el buen pensamiento.\nEs el Nawal del temblor o sismo.\nPersonas muy creativas e imaginativas.',
		'src/imagenesNahuales/17.jpg'
	),
	(
		3,
		18,
		'Tijax',
		NULL,
		'Pedernal o obsidiana',
		'<p>\n    <strong>Características:</strong>\n    Significa piedra y obsidiana. Es el símbolo del pedernal. Es la energía de la persona que cura en la cultura maya.\n    Es el poder del trueno y el rayo. La persona que nace bajo la influencia de este día, puede ser un gran curandero o médico con mucha energía en las manos.\n    Es ajq’íj, cura enfermedades físicas y psicológicas. Puede arreglar fracturas de los huesos.\n  </p>\n  <p>\n    Una de las influencias negativas del día es que puede causar algún sufrimiento o malestar. Según los Ajq’ijab’, es un día que “come”.\n    Para no ser alcanzado por estas influencias negativas debe hacerse alguna ofrenda y solicitar la intermediación del Guía Espiritual.\n  </p>\n  <p>\n    Es un día que puede evitar la humillación y la ruina a causa de algo o alguien. Es un día de protección.\n    Los que nacen es este día pueden llegar a ser coléricos y pueden destruir espiritual o emocionalmente a alguien.\n    A veces, nadie les aguanta y resulta difícil comprenderlos.\n  </p>\n  <p><strong>Su origen:</strong> Tz\'i <strong>destino:</strong> Keme</p>\n  <p>\n    <strong>Fortalezas:</strong>\n  </p>\n  <ul>\n    <li> Es protector de la justicia.</li>\n    <li> Es fuerte y servicial.</li>\n    <li> Es incansable por lo que quiere lograr.</li>\n    <li> Puede llegar a ser Guía Espiritual.</li>\n    <li> Posee habilidad para arreglar fracturas en los huesos.</li>\n    <li> Se puede defender muy bien ante cualquier problema.</li>\n  </ul>\n  <p>\n    <strong>Debilidades:</strong>\n  </p>\n  <ul>\n    <li> Puede ser violento y enojado.</li>\n    <li> Puede sufrir enfermedades.</li>\n    <li> Puede ofenderse fácilmente.</li>\n    <li> Puede caer en la venganza y en los pleitos.</li>\n  </ul>',
		'Nahual_3',
		'Nawal de la muerte repentina y los sufrimientos.\nDía propicio para curanderos y autoridades,  para cortar males y enfermedades.\nPersonas confrontativas que cortan toda clase de males y problemas.\n',
		'src/imagenesNahuales/18.jpg'
	),
	(
		4,
		19,
		'Kawoq',
		NULL,
		'Trueno o dificultad',
		'<p>\r\n    <strong>Características:</strong>\r\n    Es el nawal de la mujer como comadrona. Es el día de la Vara Espiritual, le Pisom Q’aq’al. Es el relámpago.\r\n    Es la dualidad del fuego sagrado en función de la espiritualidad maya. Es el día de la comunidad, de la familia, del grupo y de la sociedad.\r\n    Es la energía que facilita las lluvias para darnos buenas cosechas, principalmente la del maíz.\r\n  </p>\r\n  <p>\r\n    Proporciona capacidad y habilidad para curar y orientar. Es la energía que fortalece a las Guías Espirituales. Mantiene la energía y la fertilidad.\r\n    Es un día de mucha relación con la Madre Tierra y los elementos al proveer sabiduría para el manejo de las plantas medicinales.\r\n    Facilita la unidad y el cuidado de la familia. Es el día de la mujer como esposa y madre que calienta el seno del hogar.\r\n    También es un día especial para la plena realización de la mujer en la comunidad y en la sociedad.\r\n  </p>\r\n  <p>\r\n    <strong>Función Espiritual:</strong>\r\n  </p>\r\n  <ul>\r\n    <li> Día del terapeuta (el que arregla huesos) y de la comadrona.</li>\r\n    <li> Uno de los días para tratar enfermedades.</li>\r\n    <li> Día para invocar por la familia (hogar) y la comunidad.</li>\r\n    <li> Uno de los días especiales para pedir lluvia.</li>\r\n    <li> Día para invocar para que los niños y niñas al nacer no vengan con defectos físicos.</li>\r\n  </ul>\r\n  <p><strong>Su origen:</strong> B\'atz\' <strong>destino:</strong> Kej</p>\r\n  <p>\r\n    <strong>Fortalezas:</strong>\r\n  </p>\r\n  <ul>\r\n    <li> Es equilibrado y cariñoso.</li>\r\n    <li> Vive y trabaja por su familia.</li>\r\n    <li> Si es mujer, puede ser comadrona.</li>\r\n    <li> Puede llegar a ser Guía Espiritual.</li>\r\n    <li> Es buen comunicador y expositor.</li>\r\n  </ul>\r\n  <p>\r\n    <strong>Debilidades:</strong>\r\n  </p>\r\n  <ul>\r\n    <li> Puede caer en el enojo.</li>\r\n    <li> A veces es perseguido por los problemas y los pleitos.</li>\r\n    <li> No es muy afortunado en el amor.</li>\r\n    <li> Se le puede culpar de todo lo que pasa.</li>\r\n    <li> Muy hablador.</li>\r\n    <li> Se puede meter en donde no es llamado.</li>\r\n  </ul>',
		'Nahual_4',
		'Es el Nawal de toda clase de pleitos, es el día de la mujer,  día para curar enfermedades.\nNawal de la piedra de cuarzo y de las semillas de Tz´ité.\nPersonas creativas, defensoras de la mujer.',
		'src/imagenesNahuales/19.jpg'
	),
	(
		5,
		20,
		'Ajpu',
		NULL,
		'Cerbatanero o señor principal',
		'<p>\r\n    <strong>Características:</strong>\r\n    Es la luz y es la representación del Abuelo Sol. Significa cerbatanero, cazador, tirador y caminante.\r\n    Es el día de la fuerza corporal y del triunfo del bien sobre los obstáculos.\r\n    Es la representación del triunfo de Jun Ajpu e Ixbalamke sobre los señores de Xib’alb’a. Esta señal le fue dada a la abuela Ixmukane\r\n    cuando retoñó el cañaveral que sembraron los dos muchachos en el patio de la casa.\r\n  </p>\r\n  <p>\r\n    Es el día del gran Ajaw, el padre y su representación solar, el día de la grandeza, de la fuerza de la vida.\r\n    Es el que trae luz y claridad a los seres humanos y sobre toda la humanidad.\r\n  </p>\r\n  <p>\r\n    Es la fuerza regenerativa, el ciclo de la vida. La facultad para tener a toda la galaxia.\r\n    Rige los eclipses lunares y solares. Es el momento de servir a los demás.\r\n  </p>\r\n  <p>\r\n    <strong>Función Espiritual:</strong>\r\n  </p>\r\n  <ul>\r\n    <li> Día para ofrendar a los abuelos y abuelas fallecidas.</li>\r\n    <li> Día propicio para tratar enfermedades.</li>\r\n    <li> Se pide la vida y la fuerza.</li>\r\n    <li> Día para pedir el triunfo del bien sobre el mal.</li>\r\n  </ul>\r\n  <p><strong>Su origen:</strong> E <strong>destino:</strong> Q\'anil</p>\r\n  <p>\r\n    <strong>Fortalezas:</strong>\r\n  </p>\r\n  <ul>\r\n    <li> Puede desarrollar mejor la inteligencia.</li>\r\n    <li> Puede tener dotes de artista.</li>\r\n    <li> Es alegre.</li>\r\n    <li> Se defiende muy bien.</li>\r\n    <li> Puede llegar a ser Guía Espiritual.</li>\r\n    <li> Es bueno para la cacería.</li>\r\n  </ul>\r\n  <p>\r\n    <strong>Debilidades:</strong>\r\n  </p>\r\n  <ul>\r\n    <li> Puede caer en el enojo.</li>\r\n    <li> Puede ser tajante.</li>\r\n    <li> Es delicado.</li>\r\n    <li> Puede enfermarse.</li>\r\n    <li> Puede evadir responsabilidades.</li>\r\n    <li> Le dificulta aceptar correcciones.</li>\r\n    <li> Puede tener una actitud autosuficiencia.</li>\r\n  </ul>',
		'Nahual_5',
		'Es el Nawal de sol, día para pedir sabiduría, talento y fortaleza física.\nNawal de las flores, la  música, el deporte,  los cazadores y la agricultura.\nPersonas líderes, selectivas, buscan primero su beneficio.',
		'src/imagenesNahuales/20.jpg'
	),
	(
		6,
		1,
		'Imox',
		NULL,
		'Locura o pez',
		'  <p>\n    <strong>Características:</strong>\n    Símbolo de las fuerzas ocultas del universo manifestadas en demencia. “Imox” es el nombre de  todas las cosas secretas.\n    En general, es un día de influencias negativas. Es un día peligroso. Es símbolo del hemisferio izquierdo, la parte sutil de los seres humanos,\n    es la sensibilidad. Es la esencia de nuestra conciencia y de nuestra mente.\n  </p>\n  <p>\n    Es el nawal o espíritu del agua. Genera movimiento pero, también, descontrol emocional. Es un día con influencias negativas\n    y los que nacen en este día pueden convertirse en busca pleitos. Por eso, el día es propicio para las ceremonias de limpieza emocional.\n  </p>\n  <p>\n    Significa idiotez y locura. Es un día especial para pedir la abundancia de agua. Día para invocar por los ríos y\n    nacimientos de agua para que no se sequen. Su trabajo es ayudar al hemisferio derecho del cerebro a realizar un mejor trabajo y a tomar una buena actitud.\n  </p>\n  <p>\n    Es el día de la perturbación mental o de la equivocación.  No es indicado para tomar decisiones. Es el día en que se puede implorar y limpiar\n    las perturbaciones provocadas por el enemigo en todos los órdenes de la vida.\n  </p>\n  <p>\n    <strong>Funcion Espiritual:</strong>\n  </p>\n  <ul>\n    <li> Tratamiento de las perturbaciones mentales.</li>\n    <li> Día especial para invocar por el agua.</li>\n    <li> Invocaciones para mantener el equilibrio mental, espiritual, físico y emocional.</li>\n  </ul>\n  <p><strong>Su origen:</strong> Aj <strong>destino:</strong> Toj</p>\n  <p>\n    <strong>Fortalezas:</strong>\n  </p>\n  <ul>\n    <li> Puede desarrollar la clarividencia.</li>\n    <li> Puede captar los mensajes y señales de la naturaleza.</li>\n    <li> Puede desarrollar con mayor grado su hemisferio izquierdo.</li>\n    <li> Puede tener buenas iniciativas.</li>\n  </ul>\n  <p>\n    <strong>Debilidades:</strong>\n  </p>\n  <ul>\n    <li> Se le olvida con facilidad las cosas.</li>\n    <li> Puede resultar muy inseguro.</li>\n    <li> Puede tener reacciones violentas.</li>\n    <li> Es ordenado en sus cosas.</li>\n    <li> Puede tener un carácter variado.</li>\n  </ul>',
		'Nahual_6',
		'Es el Nawal del mar, ríos y lagos, día para sanar enfermedades de la mente, para agradecer y pedir la lluvia, enfermedades de la mente. El Nawal de todos los lugares donde está el agua.\nNo es el concepto de locura que conocemos comúnmente,  es la capacidad de sentir lo que otros no sienten, por eso dicen que  hablan locuras.\n',
		'src/imagenesNahuales/1.jpg'
	),
	(
		7,
		2,
		'Iq\'',
		NULL,
		'Viento o luna',
		'<p>\r\n    <strong>Características:</strong>\r\n    Es el viento y la vida. Es nawal de la lluvia. Es el día del Corazón del Cielo y Corazón de la Tierra. Es el aire y el soplo sagrado que da fuerza y vida.\r\n    En este día se le pide al viento que se lleve los sufrimientos o las enfermedades de la persona.\r\n  </p>\r\n  <p>\r\n    Significa aire y aliento de vida. También, es el nawal de Junraqan (Huracán) convertido en tornado. Es uno de los Cargadores del Tiempo.\r\n    Es, también, la respiración de la persona. Es el soplo sagrado, suave y apacible purificador del cuerpo, de la mente, del espíritu y de las emociones.\r\n    Es el espacio invisible existente entre la materia. Es uno de los elementos que produce los fenómenos naturales.\r\n  </p>\r\n  <p>\r\n    El niño que nace en Iq’ es un niño que hace de todo pero no llega a nada. Es como el aire que toca y arrastra todo lo que encuentra en su camino.\r\n    Puede construir pero también destruye.\r\n  </p>\r\n  <p>\r\n    <strong>Función Espiritual:</strong>\r\n  </p>\r\n  <ul>\r\n    <li> Es día propicio para efectuar ceremonias al espíritu del aire o viento.</li>\r\n    <li> Día para tratar enfermedades respiratorias, psicológicas y emocionales.</li>\r\n    <li> Día de invocación para que el aire no destruya las siembras.</li>\r\n  </ul>\r\n  <p><strong>Su origen:</strong> I\'x <strong>destino:</strong> Tz\'i\'</p>\r\n  <p>\r\n    <strong>Fortalezas:</strong>\r\n  </p>\r\n  <ul>\r\n    <li> Puede adaptarse a cualquier situación.</li>\r\n    <li> Posee fuerza física.</li>\r\n    <li> Es soñador e imaginativo.</li>\r\n    <li> Puede tener ideas futuristas.</li>\r\n    <li> No asusta casi nada.</li>\r\n  </ul>\r\n  <p>\r\n    <strong>Debilidades:</strong>\r\n  </p>\r\n  <ul>\r\n    <li> De carácter muy fuerte.</li>\r\n    <li> Puede resultar inseguro e impulsivo.</li>\r\n    <li> Puede caer en la infidelidad con su pareja.</li>\r\n    <li> Puede sufrir algunos problemas sociales y económicos.</li>\r\n    <li> Le encanta decir directamente las cosas.</li>\r\n  </ul>',
		'Nahual_7',
		'Es el Nawal del aire y la luna, del espíritu del ser humano. Día para alejar energías malas y enfermedades. Es el viento que limpia nuestra casa y nuestro cuerpo.\nPersonas nobles que se involucran en los problemas de otros fácilmente. Van y vienen de un lugar a otro, como el viento.',
		'src/imagenesNahuales/2.jpg'
	),
	(
		8,
		3,
		'Aq\'ab\'al',
		NULL,
		'Amanecer, aurora y mano',
		'<p>\n    <strong>Características:</strong>\n    Es el símbolo de la mano y de la aurora formada por los primeros rayos del sol que se asoman sobre\n    las montañas para disipar las tinieblas y la oscuridad de la noche.\n  </p>\n  <p>\n    Significa amanecer, aurora, luz, claridad, nuevo día. Es la renovación de energía.\n    Es la llegada de la luz, del crepúsculo, la luz que se asoma detrás de los cerros y montañas.\n  </p>\n  <p>\n    Es el día del amanecer, del futuro promisorio que esperamos cada día, los mejores días para nuestro pueblo y para cada persona en particular.\n  </p>\n  <p>\n    <strong>Función Espiritual:</strong>\n  </p>\n  <ul>\n    <li> Aclara los conocimientos.</li>\n    <li> Aclara el camino de la vida.</li>\n    <li> Conduce a nuevas oportunidades de la vida.</li>\n    <li> Ilumina las cosas ocultas.</li>\n    <li> Día para agradecer la creación del ser humano.</li>\n  </ul>\n  <p><strong>Su origen:</strong> Tz\'ikin <strong>destino:</strong> Batz\'</p>\n  <p>\n    <strong>Fortalezas:</strong>\n  </p>\n  <ul>\n    <li> Es madrugador, alegre y sereno.</li>\n    <li> Puede tener buen carácter.</li>\n    <li> Puede tener dotes para tratar enfermedades.</li>\n    <li> Puede ser Guía Espiritual.</li>\n    <li> Son fuertes, dinámicos y astutos.</li>\n    <li> Puede tener seguridad mental y física.</li>\n  </ul>\n  <p>\n    <strong>Debilidades:</strong>\n  </p>\n  <ul>\n    <li> No es bien reconocido en su tierra.</li>\n    <li> Puede encontrar el fracaso.</li>\n    <li> Puede caer en la mentira y la traición.</li>\n    <li> Puede tener dificultades en lo económico.</li>\n    <li> Es un poco reservado y aislado.</li>\n  </ul>',
		'Nahual_8',
		'Es el Nawal de la claridad, día para pedir que salga la luz en todas las cosas.\nEl día de las personas que componen los huesos de los enfermos y de los curanderos con plantas.\nPersonas que cumplen sus compromisos.\n',
		'src/imagenesNahuales/3.jpg'
	),
	(
		9,
		4,
		'K\'at',
		NULL,
		'Red, cautiverio o iguana',
		'<p>\r\n    <strong>Características:</strong>\r\n    Está relacionado con la palabra k’atik que significa arder. Símbolo del fuego y de la red. En el ritual se hace mención del día como\r\n    tiempo para el enredo y el desenredo. Es el que enreda y desenreda la vida.\r\n  </p>\r\n  <p>\r\n    Es la red donde se guarda la mazorca. La red con la que se pesca. La red donde mueren los peces. Significa cautiverio y ausencia de libertad.\r\n    Signo de opresión que se ejerce sobre una comunidad.\r\n  </p>\r\n  <p>\r\n    Es el trastecito o el bracero que le entregan a uno cuando recibe el Pisom Q’aq’al o la Vara Sagrada.\r\n    Para los nacidos en K’at, en la espiritualidad maya, se les recomienda visitar al Ajq’ij cada veinte días para efectuar su ceremonia.\r\n    De lo contrario, pueden tener muchos enredos en el camino, en el trabajo y en la vida.\r\n  </p>\r\n  <p>\r\n    <strong>Función Espiritual:</strong>\r\n  </p>\r\n  <ul>\r\n    <li> Se puede pedir por la liberación de algún preso.</li>\r\n    <li> Pedir porque el parto sea normal.</li>\r\n    <li> Día del desenvolvimiento e investigación de la ciencia.</li>\r\n    <li> Día para arreglar problemas emocionales y de amor.</li>\r\n  </ul>\r\n  <p><strong>Su origen:</strong> Ajmaq <strong>destino:</strong> E</p>\r\n  <p>\r\n    <strong>Fortalezas:</strong>\r\n  </p>\r\n  <ul>\r\n    <li> Persona sincera y ordenada.</li>\r\n    <li> Puede ser líder.</li>\r\n    <li> Puede ser una persona muy afortunada en lo económico.</li>\r\n    <li> Puede ser Guía Espiritual.</li>\r\n    <li> Persona muy activa y curiosa.</li>\r\n    <li> Puede recordar las cosas facilidad.</li>\r\n    <li> Puede ser muy tajante en su decisión.</li>\r\n  </ul>\r\n  <p>\r\n    <strong>Debilidades:</strong>\r\n  </p>\r\n  <ul>\r\n    <li> Puede caer en los chismes y en el enojo.</li>\r\n    <li> Puede resultar nervioso.</li>\r\n    <li> Puede perder las cosas con facilidad.</li>\r\n    <li> Puede estar propenso a malas influencias.</li>\r\n    <li> Puede caer en el individualismo.</li>\r\n    <li> Puede caer en el orgullo.</li>\r\n    <li> Con tendencia a meterse en los problemas ajenos.</li>\r\n  </ul>',
		'Nahual_9',
		'Es el Nawal de las cárceles visibles e invisibles. Es guardador.\nRepresenta la red donde se guarda el  maíz y donde se atrapan los peces. Día para pedir por los que están presos, para enredar y desenredar las cosas.\nPersonas con mucho fuego en su ser.  Manejan energías positivas y negativas',
		'src/imagenesNahuales/4.jpg'
	),
	(
		10,
		5,
		'Kan',
		NULL,
		'Serpiente emplumada',
		' <p>\r\n    <strong>Características:</strong>\r\n    Significa movimiento, Es el símbolo de la Gran Energía que creó el Universo. Es la Serpiente Emplumada o Q’uq’umatz.\r\n    Es la evaluación humana y el desarrollo espiritual. Es la Sabiduría y el ciclo del tiempo. Es guardián del bosque. Es el día de la transformación.\r\n  </p>\r\n  <p>\r\n    significa justicia y equilibrio. Es un día muy fuerte y “enojado”. Es un día que puede traer malas influencias como el enojo y la riña.\r\n    Sin embargo, es un símbolo de la verdad y es rápido e implacable cuando la justicia señala a alguien el lugar de los perdedores.\r\n    La energía del día se presta para la solución de problemas.\r\n  </p>\r\n  <p>\r\n    <strong>Función Espiritual:</strong>\r\n  </p>\r\n  <ul>\r\n    <li> Invocaciones por la igualdad y justicia.</li>\r\n    <li> Día para desarrollar la fuerza física.</li>\r\n    <li> Día para desarrollar el fuego interior y la evolución espiritual.</li>\r\n    <li> Uno de los días para realizar invocaciones por la lluvia.</li>\r\n    <li> Día para alejar el enojo, la timidez y el mal carácter.</li>\r\n  </ul>\r\n  <p><strong>Su origen:</strong> No\'j <strong>destino:</strong> Aj</p>\r\n  <p>\r\n    <strong>Fortalezas:</strong>\r\n  </p>\r\n  <ul>\r\n    <li> Persona con mucho conocimiento.</li>\r\n    <li> Puede tener mucha habilidad para la intuición.</li>\r\n    <li> Muy inteligente.</li>\r\n    <li> Practica la sinceridad y la justicia.</li>\r\n    <li> Puede llegar a ser líder.</li>\r\n    <li> Puede tener habilidad para los pronósticos y la clarividencia.</li>\r\n    <li> Puede ser Guía Espiritual.</li>\r\n    <li> Es humilde.</li>\r\n  </ul>\r\n  <p>\r\n    <strong>Debilidades:</strong>\r\n  </p>\r\n  <ul>\r\n    <li> Puede estar influenciado por el enojo y la traición.</li>\r\n    <li> Puede caer en el resentimiento y la avaricia.</li>\r\n    <li> Es desconfiado y sorpresivo.</li>\r\n  </ul>',
		'Nahual_10',
		'Es el Nawal de la creación del hombre y la mujer. Es el dueño de todas las cosas materiales.  Día para pedir solución a toda clase de problemas y necesidades.\nPersonas con un alto sentido de la lealtad.',
		'src/imagenesNahuales/5.jpg'
	),
	(
		11,
		6,
		'Kame',
		NULL,
		'Muerte o dueño de la oscuridad',
		'<p>\r\n    <strong>Características:</strong>\r\n    Es el símbolo de la muerte. Símbolo de la disolución final de todas las cosas, buenas y malas. Significa tecolote y muerte.\r\n    Es el renacimiento. Significado que se expresa a través de los sagrados granos de Tz’ite’ o Palo de Pito. Es día propicio para\r\n    pedir por la salud de los enfermos y para hacer ofrendas porque progrese el negocio.\r\n  </p>\r\n  <p>\r\n    Es la energía de las personas que mueren de manera natural. Puede restar fuerza a una persona o fortalecerla. Pronostica lo bueno y lo malo.\r\n    Es la comunicación con las abuelas y abuelos a través de las candelas de cebo que se ofrecen en las ceremonias.\r\n    Prudencia y protección para evitar accidentes. Es el Juez Supremo de todas las cosas. Nawal de la enfermedad y de la muerte.\r\n  </p>\r\n  <p>\r\n    <strong>Función Espiritual:</strong>\r\n  </p>\r\n  <ul>\r\n    <li> Es un día bueno para el negocio.</li>\r\n    <li> Día especial para comunicarse con los ancestros.</li>\r\n    <li> Fortalecimiento de la vida.</li>\r\n    <li> Día para pedir protección en los viajes.</li>\r\n    <li> Día para contrarrestar enfermedades.</li>\r\n  </ul>\r\n  <p><strong>Su origen:</strong> Tijax <strong>destino:</strong> I’x</p>\r\n  <p>\r\n    <strong>Fortalezas:</strong>\r\n  </p>\r\n  <ul>\r\n    <li> Puede ser médico.</li>\r\n    <li> Es fuerte ante sus enemigos.</li>\r\n    <li> Es inteligente, respetuoso y seguro.</li>\r\n    <li> Puede controlarse.</li>\r\n    <li> Puede desarrollar habilidades para la clarividencia.</li>\r\n  </ul>\r\n  <p>\r\n    <strong>Debilidades:</strong>\r\n  </p>\r\n  <ul>\r\n    <li> Puede tener un temperamento fuerte.</li>\r\n    <li> Propenso al suicidio.</li>\r\n    <li> Puede sufrir mucho al no cumplir con sus obligaciones con la Madre Naturaleza.</li>\r\n    <li> Puede tener tendencias a la mentira y a la infidelidad con su pareja.</li>\r\n  </ul>',
		'Nahual_11',
		'Es el Nawal de toda clase de muertes, día para pedir que se aleje la muerte. Se pide el descanso y  paz de un moribundo. La Muerte no es mala,  es el complemento de la vida, el descanso.\nEs el día para retirar energías negativas en las personas. Personas con habilidad para las artes y oficios.',
		'src/imagenesNahuales/6.jpg'
	),
	(
		12,
		7,
		'Kej',
		NULL,
		'Venado',
		'<p>\r\n    <strong>Características:</strong>\r\n    El nawal del Kej es muy masculino y si una mujer nace en este día, tiene el carácter y voz fuertes y es de alguna manera varonil.\r\n  </p>\r\n  <p>\r\n    Simboliza venado, los cuatro sostenes, los cuatro pilares, es decir los cuatro puntos cardinales.\r\n    Es el día fuerte y bueno.  Es un día que aplasta.   Es un día que demuestra su fuerza y su poder.\r\n  </p>\r\n  <p>\r\n    Los que nacen en este día:  son de carácter fuerte y poseen fortaleza física.  Son buenos defensores de otras personas,\r\n    pero no pueden defenderse a sí mismos.  pueden ser ricos y poseer muchos bienes. generalmente gozan de buena salud pues no se enferman con facilidad.\r\n  </p>\r\n  <p>\r\n    Son los cuatro puntos cardinales que sostienen el mundo; sostiene  la vida del hombre.  Los que nacen en este día son caminantes y tienen  suerte en el negocio.\r\n  </p>\r\n  <p>\r\n    Es el día en que se pide fuerza, fortalecimiento, endurecimiento, para que uno sea duro, aguantador en caso de enfermedades, golpes, críticas,\r\n    que uno aguante lo duro de la vida. Los que nacen en Kej podrían ser buenos guías espirituales mayas.\r\n  </p>\r\n  <p>\r\n    <strong>Significado:</strong>\r\n  </p>\r\n  <ul>\r\n    <li> La cruz maya.</li>\r\n    <li> Los cuatro puntos cardinales.</li>\r\n    <li> Los cuatro sostenes de la tierra.</li>\r\n    <li> Nawal de los defensores.</li>\r\n    <li> Los cuatro colores de las energías.</li>\r\n    <li> Caballo, fuerza, aguantador.</li>\r\n  </ul>\r\n  <p>\r\n    <strong>Fortalezas:</strong>\r\n  </p>\r\n  <ul>\r\n    <li> Buenos defensores</li>\r\n    <li> Poseen riquezas</li>\r\n    <li> Gozan de buena salud</li>\r\n    <li> Son buenos guías espirituales</li>\r\n    <li> Son muy sociables</li>\r\n    <li> Son fuertes, inteligentes, responsables, positivos y triunfadores.</li>\r\n    <li> En el matrimonio son muy equilibrados</li>\r\n  </ul>\r\n  <p>\r\n    <strong>Debilidades:</strong>\r\n  </p>\r\n  <ul>\r\n    <li> Puede hacer el mal con su pensamiento</li>\r\n    <li> Tiene un carácter fuerte</li>\r\n    <li> Pueden ser muy compulsivos</li>\r\n    <li> Les gusta la popularidad y el poder</li>\r\n    <li> Podrían ser autocráticos, manipuladores etc.</li>\r\n    <li> Les gusta la comodidad</li>\r\n    <li> Son muy reservados</li>\r\n    <li> Autoritarios</li>\r\n    <li> Suelen ser exigentes</li>\r\n    <li> Les gusta hundir y aplastar a las personas.</li>\r\n    <li> Podrían ser necios</li>\r\n  </ul>',
		'Nahual_12',
		'Es el nawal de toda clase de animales cuadrúpedos. Día para pedir fuerza para cargar con nuestras penas.\nNawal de las cuatro esquinas del mundo.\nDía de los Ajqíjab´ o sacerdotes mayas.\nPersonas líderes, dominantes con su pareja, les gusta la fama.',
		'src/imagenesNahuales/7.jpg'
	),
	(
		13,
		8,
		'Q\'anil',
		NULL,
		'Semilla, simiente o conejo',
		'<p>\r\n    <strong>Características:</strong>\r\n    Este es un día propicio para las rogativas que se hacen con relación al maíz y para darle gracias a la divinidad de la tierra, por la cosecha de maíz.\r\n  </p>\r\n  <p>\r\n    Es el nawal de las cosechas. El que nace en este día es buen agricultor. Hay que buscar este tanto para la siembra como para la cosecha del maíz.\r\n  </p>\r\n  <p>\r\n    Simboliza los cuatro colores del maíz existentes en Meso América: rojo, negro, blanco y amarillo. Los cuatro colores de la piel de la humanidad.\r\n    Los cuatro puntos cardinales del universo. En este día se pide buena cosecha. Es el día del agricultor.\r\n  </p>\r\n  <p>\r\n    <strong>Significado:</strong>\r\n  </p>\r\n  <ul>\r\n    <li> Nawal de la semilla.</li>\r\n    <li> germinación de todos los seres vivientes.</li>\r\n    <li> Día de la construcción de los primeros abuelos del maíz.</li>\r\n  </ul>\r\n  <p><strong>Día de:</strong> La Fecundación y de La Germinación.</p>\r\n  <p>\r\n    <strong>Fortalezas:</strong>\r\n  </p>\r\n  <ul>\r\n    <li> Afortunados en las siembras o crianza de animales</li>\r\n    <li> Muy fértiles en tener hijos</li>\r\n    <li> Son buenos comerciantes</li>\r\n    <li> suelen tener Signos de intensa energía en su cuerpo</li>\r\n    <li> Extremadamente inteligentes</li>\r\n    <li> Les gusta hablar, debatir, leer, escribir</li>\r\n    <li> Aficionados al ejercicio físico o la danza</li>\r\n    <li> Mente compleja</li>\r\n    <li> Se interesan de detalles</li>\r\n  </ul>\r\n  <p>\r\n    <strong>Debilidades:</strong>\r\n  </p>\r\n  <ul>\r\n    <li> Padecen de dolor de cabeza, resfriados</li>\r\n    <li> Podrían destruir su propio hogar</li>\r\n    <li> Incrédulos</li>\r\n    <li> Creen en su imaginación</li>\r\n    <li> Regularmente son nerviosos</li>\r\n    <li> Pueden ser cobardes</li>\r\n    <li> Autodestructivos</li>\r\n    <li> Evitan las grandes  responsabilidades</li>\r\n    <li> Propensos a adquirir vicios relacionados con estimulantes</li>\r\n    <li> Muy agresivos, enojados</li>\r\n    <li> A veces son obsesivos, compulsivos</li>\r\n    <li> Llegan a donde no son llamados</li>\r\n    <li> Orgullosos</li>\r\n    <li> Suelen ser egoístas</li>\r\n  </ul>',
		'Nahual_13',
		'Significa semilla, simiente,  conejo. El planeta Venus.\nEs el Nawal de toda clase de semillas animales y vegetales. Día de la fertilidad y las cosechas,  propicio para iniciar cualquier siembra o negocio.\nSignifica los cuatro colores del maíz,  rojo, negro, blanco y amarillo.\nPersonas de mano ¨caliente¨ a quienes todo lo que siembran les florece.',
		'src/imagenesNahuales/8.jpg'
	),
	(
		14,
		9,
		'Toj',
		NULL,
		'Ofrenda, pago o lluvia',
		'<p>\n    <strong>Características:</strong>\n    Significa pago, ofrenda y agradecimiento. Se ponen presentes para el pago de alguna culpa o para enmendar algún error.\n  </p>\n  <p>\n    Es el día especial de las ofrendas. Se agradece el sol, el agua, el aire, el alimento y todo lo que nos rodea y lo que hemos recibido de la Madre Tierra.\n    Los que nacen en Toj, algunas veces, son los que pagan la deuda de la familia, por eso es que pueden sufrir problemas de salud.\n  </p>\n  <p>\n    <strong>Función Espiritual:</strong>\n  </p>\n  <ul>\n    <li> Agradecimiento a Ajaw por los beneficios recibidos.</li>\n    <li> Día para ponerse en paz con Ajaw, con los abuelos y abuelas y con el prójimo.</li>\n    <li> Se hacen ceremonias para lograr el equilibrio, moral y espiritual.</li>\n    <li> Día para retirar los sufrimientos, accidentes y enfermedades.</li>\n  </ul>\n  <p><strong>Su origen:</strong> Imox <strong>destino:</strong> No\'j</p>\n  <p>\n    <strong>Fortalezas:</strong>\n  </p>\n  <ul>\n    <li> De grandes virtudes.</li>\n    <li> Es creativo, comunicativo y dinámico.</li>\n    <li> Practica la sinceridad.</li>\n    <li> Es analista, imaginativo e intuitivo.</li>\n    <li> De carácter abierta.</li>\n    <li> Es romántico.</li>\n  </ul>\n  <p>\n    <strong>Debilidades:</strong>\n  </p>\n  <ul>\n    <li> Puede sufrir enfermedades.</li>\n    <li> Puede caer en la miseria.</li>\n    <li> Puede tener inestabilidad mental.</li>\n    <li> Puede estar expuesto a accidentes.</li>\n    <li> Puede caer en el orgullo y la vanidad.</li>\n    <li> Vicioso y orgulloso</li>\n  </ul>',
		'Nahual_14',
		'Es el Nawal de los cuatro señores del fuego,  Tojil, Awilix, Jakawitz´ y  Nikajtakaj. Día propicio para nivelar o pagar cualquier deuda. Día en que se agradece todo lo que recibimos en nuestra vida,  lo bueno y lo malo.\nPersonas con mucha sensibilidad para las artes y que lloran con',
		'src/imagenesNahuales/9.jpg'
	),
	(
		15,
		10,
		'Tz\'i\'',
		NULL,
		'Perro o mapache',
		'<p>\n    <strong>Características:</strong>\n    El antiguo significado de Tz’i’ es tepescuintle. En idioma k’iche’ es Lalo. Guardián de la milpa de la abuela Ixmukane de donde Ixk’ik’\n    trajo la red llena de mazorcas, y que le ayudó a cumplir con su tarea de una manera mágica. En el Popol Wuj significa Jun Ajpu Wuch’,\n    cazador tacuacín y Jun Ajpu Utiw, cazador coyote. También es guardián de los cerros, las montañas, las veredas y los barrancos.\n  </p>\n  <p>\n    Es la fidelidad, la autoridad y la ley. Por tanto, es el guardián de la ley natural y espiritual. Hace los papeles de secretario.\n  </p>\n  <p>\n    Puede influir en excesivas conductas sexuales. Por eso, algunos Guías Espirituales le atribuyen como símbolo del pecado, especialmente de impureza sexual.\n    El que nace en este día puede resultar muy sexual, sea hombre o mujer. La intensidad de esta conducta dependerá del numeral que acompaña al Tz’i’\n    como día de nacimiento.\n  </p>\n  <p>\n    <strong>Función Espiritual:</strong>\n  </p>\n  <ul>\n    <li> Invocar por el orden y la exactitud.</li>\n    <li> Puede interpretar lo conocido y lo desconocido.</li>\n    <li> Se invoca el día para que guíe y cuide el camino.</li>\n    <li> Día para contrarrestar calumnias y ofensas.</li>\n    <li> Día de protección ante la ley.</li>\n  </ul>\n  <p><strong>Su origen:</strong> Iq\' <strong>destino:</strong> Tijax</p>\n  <p>\n    <strong>Fortalezas:</strong>\n  </p>\n  <ul>\n    <li> Atento, valiente, respetado, justo.</li>\n    <li> Es defensor de otras personas.</li>\n    <li> Es cordial.</li>\n    <li> Logra lo que busca.</li>\n    <li> Buen investigador y presiente las cosas o actos.</li>\n    <li> Enamorado.</li>\n    <li> Es el día de los abogados</li>\n  </ul>\n  <p>\n    <strong>Debilidades:</strong>\n  </p>\n  <ul>\n    <li> Puede resultar vicioso e infiel.</li>\n    <li> Puede caer en la mentira.</li>\n    <li> Puede tener mucha tendencia sexual.</li>\n    <li> Puede resultar con temperamento fuerte.</li>\n  </ul>',
		'Nahual_15',
		'Es el Nawal de la justicia, la autoridad material y espiritual, el orden. Día para pedir la solución a los problemas ante los tribunales. Día para  alejar los vicios. Son las personas que hablan por otros.  Los dueños de las leyes. Juzgan a los demás.',
		'src/imagenesNahuales/10.jpg'
	),
	(
		16,
		11,
		'B\'atz\'',
		NULL,
		'Mono o hilo',
		'<p>\n    <strong>Características:</strong>  Es el símbolo del hombre y de la humanidad, de la realización del hombre.\n  </p>\n  <p>\n    Símbolo de continuidad con el pasado, como se ha englobado dentro del ritual. “Un buen día,  de la perpetración de las  ceremonias y costumbres de nuestros antepasados.\n  </p>\n  <p>\n    Es el día  en  que se realiza aquella parte del matrimonio en que se pide la novia, y el casamiento cuarenta días después, en un día B’atz’ con un número más alto.\n    En 8 B’atz’ se presenta públicamente el aprendiz de sacerdote maya, y cuarenta días después se realiza el agradecimiento.\n  </p>\n  <p>\n    Simboliza el tiempo.  Nuestros antepasados, los mayas representaron el tiempo imaginándolo como un hilo enrollado a un carrizo que se encuentra debajo de la tierra.\n    Este hilo se va desenrollando a medida que el tiempo pasa. La  historia se teje con el tiempo, así como el hilo  teje los vestidos. El ciclo Nuevo Maya,\n    Wajxaqib’ B’atz’, en la ceremonia se ameniza con marimba y se baila alrededor del fuego.  El  B’atz’ amarra y desata.  Se le dice B’atz’ porque gira.   Y es el talento del ser humano.\n  </p>\n  <p>\n    <strong>Significa:</strong>\n  </p>\n  <ul>\n    <li>Enlace matrimonial</li>\n    <li> Mono, hilo, amarrador</li>\n    <li> El tiempo. desarrollo de la evolución  humana, dándonos la vida</li>\n    <li> Nawal de medidor del tiempo y de toda clase de tejidos</li>\n    <li> Es un buen día para recibir el destino como sacerdote Maya</li>\n    <li> Orador, escultor, tallador y artista, música, flauta, deporte y siembra.</li>\n  </ul>\n  <p><strong>Significado Clave:</strong> La representación y el talento artístico</p>\n  <p>\n    <strong>Fortalezas:</strong>\n  </p>\n  <ul>\n    <li> Inteligente, astuto </li>\n    <li> Amable</li>\n    <li> Reservado </li>\n    <li> Suelen imitar lo que ven</li>\n    <li> Tienen buenas señales</li>\n    <li> Adinerados (Ricos)</li>\n    <li> Maestros de todas las artes</li>\n  </ul>\n  <p>\n    <strong>Debilidades:</strong>\n  </p>\n  <ul>\n    <li> Inseguro </li>\n    <li> Haragán</li>\n    <li> Enojado, agresivo </li>\n    <li> Envidioso, calumniador</li>\n    <li> Mala imaginación, incrédulo</li>\n    <li> Ambicioso de cualquier cosa </li>\n    <li> Débil de voluntad</li>\n  </ul>',
		'Nahual_16',
		'Es el Nawal de todas las artes, de los tejidos, de los artistas. Es un día propicio para pedir pareja, amarrar o desatar cualquier asunto.\nSon maestros de todas las artes.\n',
		'src/imagenesNahuales/11.jpg'
	),
	(
		17,
		12,
		'E\'',
		NULL,
		'Camino o diente',
		'<p>\r\n    <strong>Características:</strong>\r\n    Simboliza el camino y el destino. Es el guía. Es el que nos lleva a un punto fijo. Uno de los Cargadores del Tiempo. Es la protección de los viajeros y caminantes. Conduce la vida espiritual y material.\r\n  </p>\r\n  <p>\r\n    Es el que hace posible la realización humana en todos los órdenes y en todas las manifestaciones.\r\n    Pero también puede simbolizar los obstáculos con que los seres humanos se tropiezan en la continua búsqueda de esa realización.\r\n  </p>\r\n  <p>\r\n    Es un día bueno para desplazarse en cualquier lugar. En caso de peligro, el Ajaw E es el que da la protección.\r\n    También es día bueno para agradecer el bienestar físico, la vida misma de las personas y el trabajo. Es un día muy sagrado.\r\n    Por esta razón, se puede pedir su protección, como dice el Popol Wuj “que no se caigan en la bajada ni en la subida del camino.\r\n    Que no encuentren obstáculos ni detrás ni delante de ellos, ni cosa que los golpee. Concédeles buenos caminos, hermosos caminos planos…”.\r\n  </p>\r\n  <p>\r\n    Es el viaje, la travesía y el trayecto.  Se ofrecen ceremonias o invocaciones para que limpie el camino de los peligros y de los accidentes.\r\n  </p>\r\n  <p>\r\n    <strong>Función Espiritual:</strong>\r\n  </p>\r\n  <ul>\r\n    <li> Protección ante las tentaciones</li>\r\n    <li> Protección ante los peligros del camino</li>\r\n    <li> Día para iniciar un proyecto</li>\r\n    <li> Día de protección de los pilotos</li>\r\n    <li> Día para encauzar mejor el destino</li>\r\n  </ul>\r\n  <p><strong>Su origen:</strong> K\'at <strong>destino:</strong> Ajpu</p>\r\n  <p>\r\n    <strong>Fortalezas:</strong>\r\n  </p>\r\n  <ul>\r\n    <li> Es amable y trabajador</li>\r\n    <li> Es guía y consejero</li>\r\n    <li> Es cariñoso y alegre </li>\r\n    <li> Es viajero y puede ser comerciante</li>\r\n    <li> Afortunado, decidido, comprensivo</li>\r\n    <li> Cuidadoso en las cosas</li>\r\n  </ul>\r\n  <p>\r\n    <strong>Debilidades:</strong>\r\n  </p>\r\n  <ul>\r\n    <li> Desconfiado e inseguro</li>\r\n    <li> Algunas veces se puede resentir</li>\r\n    <li> Es variable con su carácter</li>\r\n    <li> Es nervioso y frágil</li>\r\n    <li> Impaciente en algunas ocasiones</li>\r\n  </ul>',
		'Nahual_17',
		'Es el Nawal de todos los caminos y dirigentes. Del sistema nervioso y sanguíneo.\nDía propicio para iniciar cualquier viaje o negocio.\nSon líderes naturales.',
		'src/imagenesNahuales/12.jpg'
	),
	(
		18,
		13,
		'Aj',
		NULL,
		'Caña o cañaveral',
		'<p>\r\n    <strong>Características:</strong>\r\n    Simboliza caña veral y milpa. Todo lo que se relaciona al hogar y la familia. Es el símbolo que dejó Jun Ajpu Ixb’alamkej de su vida,\r\n    cuando sembró la caña en medio del patio de la casa de la abuela Ixmukane. Aj es símbolo de la resurrección de Jun Ajpu e Ixb’alamkej,\r\n    quienes no murieron en manos de los señores de Xib’alb’a. Es el triunfo del bien sobre el mal.\r\n  </p>\r\n  <p>\r\n    Es el destino representado por el Nawal o los Nawales. 8 Aj es el día en el cual se establece el destino de uno, para llamarlo y reconocerlo.\r\n  </p>\r\n  <p>\r\n    también es elote, maíz tierno.  Día relacionado con todo lo que concierne a los niños.\r\n    Es día bueno y sobre todo para rezar por las criaturas.\r\n  </p>\r\n  <p>\r\n    También es el día de la enfermedad debilidad en el tejido óseo, pero de mucha energía espiritual.\r\n    Es el hogar, la casa, todo lo que se relaciona con la casa. Los que nacen en Aj pueden ser sacerdotes mayas.\r\n  </p>\r\n  <p>\r\n    <strong>Función Espiritual:</strong>\r\n  </p>\r\n  <ul>\r\n    <li> El hogar y la familia de todas las generaciones tiernas; 8 Aj se celebra el día del niño.</li>\r\n    <li> El bastón del poder de las virtudes divinas, sensatez, la palabra sagrada.</li>\r\n    <li> Caña, símbolo que dejó Jun Ajpu Ixbalanke de su vida, cuando sembró la caña en el patio, dueño del Hogar, y ternura.</li>\r\n    <li> Nawal de las artes.</li>\r\n  </ul>\r\n  <p><strong>Significado Clave:</strong> La integridad de la fe</p>\r\n  <p>\r\n    <strong>Fortalezas:</strong>\r\n  </p>\r\n  <ul>\r\n    <li> Autoridad</li>\r\n    <li> Inteligente</li>\r\n    <li> Estricto</li>\r\n    <li> Es respetado por sus amigos</li>\r\n    <li> Principios sólidos en el terreno moral y ético</li>\r\n    <li> Atraído por la religión o los estudios filosóficos y teológicos</li>\r\n    <li> Trabajador</li>\r\n    <li> Bromista</li>\r\n  </ul>\r\n  <p>\r\n    <strong>Debilidades:</strong>\r\n  </p>\r\n  <ul>\r\n    <li> Regaña</li>\r\n    <li> Celoso</li>\r\n    <li> Nervioso</li>\r\n    <li> Expuesto  a discutir y  juzgar</li>\r\n    <li> Hace lo que le plazca</li>\r\n    <li> Extremista, no es de moderación</li>\r\n    <li> Hace bromas pesadas</li>\r\n    <li> No es constante en la fe</li>\r\n    <li> Variable</li>\r\n    <li> Sufre con frecuencia, se enferma en la niñez</li>\r\n    <li> Alcohólico</li>\r\n    <li> Destructor</li>\r\n    <li> Una vida variable, de dolor</li>\r\n    <li> tristeza y alegría</li>\r\n  </ul>',
		'Nahual_18',
		'Es el Nawal de la casa y de los niños, día propicio para el hogar y la salud de los niños.\nNawal de las generaciones tiernas.\nPersonas que no pueden negarse ante otros.',
		'src/imagenesNahuales/13.jpg'
	),
	(
		19,
		14,
		'I\'x',
		NULL,
		'Jaguar',
		'<p>\r\n    <strong>Características:</strong>\r\n    Es el símbolo y energía de la Madre Tierra. Representa los lugares o centros ceremoniales donde se llevan a cabo las ceremonias.\r\n    Son los cerros, las montañas, las planicies. Significa Jaguar.\r\n  </p>\r\n  <p>\r\n    Representa el altar maya o sea el tab’al. Es un día especial para pedir la vida de los animales tanto domésticos como salvajes.\r\n    Se le pide a Ajaw una buena cosecha de cualquier cultivo, en especial el de las verduras.\r\n    En este día se encienden candelas de color verde, ya que simbolizan el color de la Madre Tierra.\r\n  </p>\r\n  <p>\r\n    Representa el altar maya o sea el tab’al. Es un día especial para pedir la vida de los animales tanto domésticos como salvajes.\r\n    Se le pide a Ajaw una buena cosecha de cualquier cultivo, en especial el de las verduras. En este día se encienden\r\n    candelas de color verde, ya que simbolizan el color de la Madre Tierra.\r\n  </p>\r\n  <p>\r\n    <strong>Función Espiritual:</strong>\r\n  </p>\r\n  <ul>\r\n    <li> Propicia energía espiritual y física.</li>\r\n    <li> Invocación por la lluvia.</li>\r\n    <li> Invocación por la vida de los animales.</li>\r\n    <li> Día de invocación por la salud de toda la humanidad.</li>\r\n    <li> Día para realizar invocaciones para que las siembras estén protegidas de los animales.</li>\r\n  </ul>\r\n  <p><strong>Su origen:</strong> Keme <strong>destino:</strong> Iq\'</p>\r\n  <p>\r\n    <strong>Fortalezas:</strong>\r\n  </p>\r\n  <ul>\r\n    <li> Es paciente, fuerte, responsable, valiente, respetuoso, vigoroso y atrevido.</li>\r\n    <li> Es decisivo y realista.</li>\r\n    <li> Es de buen corazón.</li>\r\n    <li> Buen padre de familia.</li>\r\n    <li> Puede ser líder y famoso si sabe encauzar sus energías.</li>\r\n  </ul>\r\n  <p>\r\n    <strong>Debilidades:</strong>\r\n  </p>\r\n  <ul>\r\n    <li> Puede llegar a tener un carácter fuerte.</li>\r\n    <li> Algunas veces se enoja y se impacienta.</li>\r\n    <li> Su carácter le puede hacer prepotente, orgulloso, colérico, serio y vengativo.</li>\r\n  </ul>',
		'Nahual_19',
		'Es el Nawal de la naturaleza y los altares mayas, día para pedir fortaleza física y mental.\nEs el Nawal de las siete vergüenzas humanas: orgullo, ambición, envidia, mentira, crimen, ingratitud, ignorancia por pereza.\nPersonas de razonamiento interno a las que les gusta la naturaleza y la soledad.',
		'src/imagenesNahuales/14.jpg'
	);

-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `pagina`
--
CREATE TABLE IF NOT EXISTS `pagina` (
	`orden` int(11) NOT NULL,
	`nombre` varchar(30) NOT NULL,
	`categoria` varchar(100) NOT NULL,
	`seccion` varchar(45) DEFAULT NULL,
	`htmlCodigo` longtext,
	PRIMARY KEY (`nombre`, `categoria`),
	KEY `FK_PAGINA_CATG` (`categoria`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--
-- Volcado de datos para la tabla `pagina`
--
INSERT INTO
	`pagina` (
		`orden`,
		`nombre`,
		`categoria`,
		`seccion`,
		`htmlCodigo`
	)
VALUES
	(
		2,
		'Energia',
		'Calendario Cholquij',
		'Elementos',
		'<p>El calendario Cholq\'ij utiliza las energías del 1 al 13 pero su ciclo es de meses y días.</p>\n\n<p> La relación del 13 con los ciclos de la vida es múltiple, entre ellas se pueden mencionar:</p>\n<ul>\n	<li>Las 13 energías en el nacimiento</li>\n	<li>Los 13 ciclos de 20 días de un año Cholq’ij.</li>\n</ul>\n<p>\nEl 13 es una cantidad importante en el pensamiento maya. Se utiliza para indicar el nivel de\nenergía y al combinar con el significado de los nawales construye la personalidad.		Este número\ntiene influencia en toda la vida, marca la niñez, juventud, madurez y ancianidad.\n</p>\n'
	),
	(
		0,
		'Forma de Contar',
		'Calendario Cholquij',
		'Informacion',
		'<h2>Forma de contar</h2>\n<p> Una manera de contar el Cholq’ij para los maya k’iche’ de la actualidad es iniciar el conteo en Waqxaqib’ B’atz’ (8 B’atz’), repitiendo así cada 260 días ese número y fecha (Aj Xol Ch’ok, 2008). Cada día del calendario se combina con un numeral que va del 1 al 13, hasta completar 260 días. El mismo día en que inicia la cuenta vuelve a repetirse cada 260 días. En la antigüedad se acostumbraba a empezar el calendario en 1 Imox y se seguía el mismo proceso de multiplicación de los numerales con los días para alcanzar el total de 260 (Aj Xol Ch’ok, 2008). La construcción del ciclo de 260 días del calendario Cholq’ij tiene como base la disciplina vigesimal maya (13X20); “esta relación organiza una frecuencia matemática del movimiento natural lunar de 13:20 que se determina en base a las gravitaciones, principalmente de la Luna–Tierra, las cualidades del ser en la madre Tierra de acuerdo a su día de engendración, día del nacimiento y su proyección o misión en la vida” (García, Curruchiche & Taquirá, 2009, p. 234). Los días de este calendario “son representados también en los 10 dedos superiores de las manos, más los 10 dedos inferiores de los pies, lo que suma 20, que representa los días del Cholq’ij”, pues la construcción matemática del sistema vigesimal maya “se fundamenta en el Jun Winaq de 20 dedos” (García, Curruchiche & Taquirá, 2009, p. 47 y 234).</p>\n'
	),
	(
		0,
		'Informacion',
		'Calendario Cholquij',
		'Informacion',
		'<p>\n	El Cholq´ij deriva su nombre de los términos maya-k´iche´:\n	<ul>\n		<li>Chol: Contar cosas puestas en orden</li>\n		<li>Q´ij: el sol o día</li>\n	</ul>\n</p>\n\n<p> El Cholq’ij es un calendario sagrado del pueblo Maya, compuesto por 260 días divididos en 13 meses. También recibe el nombre de calendario ritual o calendario sagrado o Tzolkin (Barrios, 2004; García, Curruchiche & Taquirá, 2009; Aj Xol Ch’ok, 2008; Rupflin, 1999).</p>\n\n<p>“El Cholq´ij es uno de los instrumentos que los Abuelos del Pueblo maya crearon; tiene dos aplicaciones principales, la primera: ubica momentos para actividades colectivas; la segunda: tiene una aplicación individual para identificar la conducta natural o la forma de ser de las personas por medio de su nawal, es decir, los rasgos psicológicos básicos, positivos y negativos.</p>\n\n<p>Este calendario fue configurado a partir de los movimientos que la Luna realiza en su órbitta alrededor de la Tierra. Así como el calendario AB’ agrícola o solar de 365 días está configurado en base al movimiento de traslación de la Tierra alrededor del Sol y es identificado como energía masculina.</p>\n\n<p>Por otra parte, el Choloq’ij o calendario sagrado es considerado energía femenina, por su relación con los movimientos de la Luna y por la influencia que este cuerpo celeste ejerce sobre los organismos femeninos de la naturaleza y los seres humanos.”\n</p>\n'
	),
	(
		0,
		'Informacion',
		'Calendario Haab',
		'Informacion',
		'<p>El calendario solar maya, llamado Haab\', es una cuenta de 365 días y por lo tanto se aproxima al año solar es el calendario civil, agrícola Maya, es el calendario de los reyes Mayas.</p>    <p>La palabra <strong> \"HAAB\'\" </strong> significa <strong> \"AÑO\" </strong> en el idioma maya yucateco.</p>    <p>El Haab está compuesto por 18 meses de 20 días cada uno, más un mes que consta de 5 días. Cada mes de 20 días, conocido como uinal, tiene su propio nombre. Todos estos 18 meses juntos suman 360 días.</p>    <p>El último mes, compuesto de 5 días, se conoce como Wayeb. Los 19 meses en su totalidad suman 365 días.</p>    <p><strong>18 x 20 + 5 = 365 </strong></p>    <p> </p>    <figure class=\"easyimage easyimage-full\"><img alt=\"\" src=\"../imgs/Calendario Haab/0.jpeg\" width=\"300\" />  <figcaption></figcaption>  </figure>    <p>Fue elaborado por los astrónomos y matemáticos Mayas para dar respuesta a la necesidad de las personas para su abastecimiento de alimento con la siembra y cosecha del sagrado maíz, el frijol, y toda clase de productos agrícolas indispensable para la buena alimentación del ser humano; y en la necesidad de establecer el tiempo de duración del mando y cambio de autoridades imperiales, comunales y civiles del pueblo.</p>    <p>Este calendario, según los expertos, se estima que se utilizó por primera vez alrededor del solsticio de invierno de 550 ANE (Antes de Nuestra Era) y fue creado para ser utilizado en conjunto con el <strong> Tzolkin </strong>. En operación conjunta, el <strong> Haab </strong> y el <strong> Tzolkin </strong> crean un ciclo más grande de 52 años llamado como la <strong> Rueda Calendárica </strong> o <strong> Calendario Redondo</strong> que fue utilizado no solo por los mayas sino también por el resto de las culturas en Mesoamericanas.</p>    <p> </p>    <h3>Utilidad</h3>    <hr />  <p>El calendario <strong> Habb\' </strong> sirve para el control de los fenómenos astronómicos y estacionales del año solar como lo son:</p>    <ul>  <li>Equinoccios</li>  <li>Solsticios</li>  </ul>    <p>También sirve para el establecimiento de nuevas autoridades de los pueblos, marca los ritos ceremoniales colectivos y las temporadas para la siembra de cultivos, aparte de definir el temperamento de las personas de acuerdo a la fecha de su nacimiento</p>    <h3>Exactitud</h3>    <hr />  <p>Debido a que el tiempo real que tarda nuestro Sol en reaparecer exactamente en las mismas posiciones que se ve desde la Tierra es un poco más largo que 365 días (365.2421897 días), se necesitan ajustes periódicos para mantener una acumulación de los recuentos anuales del calendario en alineación con la Tierra girando alrededor del sol.</p>    <p>Los antiguos mayas abordaron este problema de manera diferente a lo que hacemos hoy. En lugar de agregar un año bisiesto cada 4 años, restaron 13 días cada 52 años.</p>    <p>Es muy interesante saber que el calendario Haab\' tiene un error de solo 1 día en 6729 años, mientras que nuestro calendario “moderno” tiene un error de solo 1 día en 3236 años.</p>   '
	),
	(
		0,
		'Informacion',
		'Rueda Calendarica',
		'Informacion',
		'<p>El nombre completo de cualquier fecha en el sistema de calendario maya consiste de una fecha Tzolk’in y\nuna fecha Haab. La Rueda Calendárica es el entretejido de los calendarios Tzolk’in y Haab. En la Rueda\nCalendárica, una combinación del Tzolk’in y el Haab no se repetirán hasta que hayan pasado 52 períodos\nde 365 días. Esto está basado en el concepto matemático de “el mínimo común denominador” y “el mínimo\ncomún múltiplo”. Ambos números, 260 y 365, son divisibles por 5, y 260 dividido por 5 es igual a 52, mientras que 365 dividido por 5 es igual a 73. Por lo tanto, el mínimo común múltiplo de 260 y 365 es 5 x 52 x 73 = 18,980.</p>\n\n</p> De este modo, la Rueda Calendárica es igual a 18,980 días, 52 x 365 o 52 años Haab. Los mayas creen\nque cuando una persona alcanza los 52 años de edad, ellos atienen la sabiduría especial de un anciano. Una\nfecha de la Rueda Calendárica, con componentes tanto del calendario Tzolk’in como el Haab, puede marcar\nde forma única un evento dentro de un período de 52 años. Sin embrago, cualquier evento que abarque más\nde 52 años requiere un calendario adicional, el calendario de Cuenta Larga. </p>\n\n<figure class=\\\"easyimage easyimage-full\\\"><img  src=\"../imgs/ruedaCalendarica.png\" style=\"width: 100%\" />  <figcaption></figcaption>  </figure>\n\n<p>El círculo más pequeño está conformado por 13 números; el círculo mediano por los 20 signos de los veinte días mayas del calendario Tzolkin, y el círculo más grande por el calendario haab con sus 365 días (dieciocho meses de veinte días y el mes corto de cinco días). En este conteo, los mayas consideraban que el día de la creación fue el 4 ahau 8 cumkú.</p>\n\n<p>Cada cíclo de 18.980 días equivale a 52 vueltas del haab (calendario solar de 365 kines) y a 73 vueltas del tzolkin (calendario sagrado de 260 kines), y al término ambos vuelven al mismo punto. Cada 52 vueltas del haab se celebraba la ceremonia del fuego nuevo, analógicamente era un \"siglo maya\".</p>'
	),
	(
		1,
		'Kin',
		'Calendario Haab',
		'Elementos',
		'<p>La escritura maya era un sistema logosilábico cuyo significado es discutido. Los símbolos individuales (\"glifos\") podían representar bien una palabra (normalmente un morfema) o una sílaba; a decir verdad, el mismo glifo con frecuencia podía usarse de las dos formas.</p>    <figure class=\"easyimage easyimage-full\"><img alt=\"\" src=\"imgs/Kin/0.jpeg\" width=\"300\" />  <figcaption></figcaption>  </figure>    <p> </p>'
	),
	(
		1,
		'Mecanismo',
		'Rueda Calendarica',
		'Informacion',
		'<h2>Mecanismo</h2>\n\n<p>De la Rueda del Calendario, se dice que el ciclo de 52 años es más importante que el año.</p>\n\n<p>Un ejemplo de fecha en la rueda calendárica, 8 Cauac 13 Zip, se referiría al octavo día de la trecena Cauac en el Tzolkin, que coincide con el día 13 de Zip en el Haab.</p>\n\n<p>La diferencia entre los 52 años de 365 días cada uno y los 52 años de 360 días, es de 260 días exactamente; así se puede llevar el cálculo de sus coincidencias a través de ciclos de 260 días, ya que</p>\n\n<ul>\n	<li>18 980 = 73 x 260</li>\n	<li>18 720 = 72 x 260</li>\n	<li>5 256 = 72  x 73 = 9 x 584.​</li>\n</ul>\n\n<p>También debe ser tomado en cuenta que 13 x 360 = 18 x 260 = 4 680.</p>\n\n<p> 	Es decir, si los 5 días de Uayeb\' son omitidos (como debe haber sido el caso en los orígenes del calendario), los períodos de 360 y de 260 días coincidirían después de, respectivamente, 13 y 18 ciclos (13 \"años\" de 360 días).</p>\n	Cuatro de esos ciclos de 13 \"años\" abarcan 52 \"años\" de 360 días.\n	Ahora, 52 veces esos 5 adicionales días de Wayeb\' resultan en exactamente uno más de los ciclos de 260 días.</p>\n	<p>El sistema de la rueda calendárica, sirve para interpretar una sucesión infinita de períodos de 52 años. Se desconoce su nombre en lenguas mayenses, pero el nombre en idioma náhuatl utilizado por los mexicas era \"Xiuhnelpilli\", aunque es más usual encontrarlo escrito como Xiuhmolpilli, forma gramaticalmente incorrecta; cuyo significado es anudación de los años.</p>\n\n	<p>Cada 52 años las culturas mesomericanas realizaban importantes ceremonias. Para el caso de los mexicas era la llamada \"ceremonia del fuego nuevo\".\n</p>\n'
	),
	(
		1,
		'Nahual',
		'Calendario Cholquij',
		'Elementos',
		'<p>Nahual, también llamado <strong>nagual</strong> o <strong>nawal​</strong> (en náhuatl: nahualli ‘oculto, escondido, disfraz’), dentro de las creencias mesoamericanas, es una especie de brujo o ser sobrenatural que tiene la capacidad de tomar forma animal. El término refiere tanto a la persona que tiene esa capacidad como al animal mismo que hace las veces de su alter ego o animal tutelar.\r\n\r\n<p>De acuerdo con la tradición y cosmovisión de los pueblos Mesoamericanos los Nahuales son espíritus y energías protectoras que acompañan a todos los elementos de la naturaleza, incluyendo a los humanos y animales a lo largo de toda su existencia.</p>\r\n\r\n<p>Para la civilización Maya el nahual de cada persona era de suma importancia. Era algo que todos debían conocer y aprender a manejarlo. Debían saber cuándo se fue engendrado, la fecha de nacimiento, el año, la energía que le protege y su misión.</p>\r\n\r\n<p>Dentro de la cultura maya se dice que cada uno está relacionado con un animal  que es quién le dirige, como un ángel guardián, alguien con quien se identifica, con quien se encuentra conectado espiritualmente. Se dice también que cada persona incluso nace con el espíritu de un animal, y este se encarga de protegerlo y guiarlo.</p>\r\n\r\n<h2 class=\"text-center\"> conoce los nahuales:</h2>\r\n<figure class=\"easyimage easyimage-full\"><img alt=\"\" src=\"../img/DiasMayas1.png\"/>  <figcaption></figcaption>  </figure>    '
	),
	(
		3,
		'Uayeb',
		'Calendario Haab',
		'Elementos',
		'<p>Los últimos cinco días del ciclo de Haab son el mes 19, llamado Uayeb. Estos son días impredecibles, no para planificar eventos importantes o viajar fuera de casa.</p>'
	),
	(
		2,
		'Uinal',
		'Calendario Haab',
		'Elementos',
		'<p>El uinal se puede ver como el equivalente a nuestros meses ya que constan de 20 días, pero en lugar de 12 de ellos, el calendario Haab Maya cuenta con 18 de ellos. Los uinales, a parte de contar el tiempo se utilizaban para realizar ciertas actividades.</p>'
	);

-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `uinal`
--
CREATE TABLE IF NOT EXISTS `uinal` (
	`idweb` int(11) NOT NULL,
	`nombre` varchar(25) NOT NULL,
	`significado` varchar(75) NOT NULL,
	`dias` int(11) DEFAULT NULL,
	`htmlCodigo` mediumtext,
	`categoria` varchar(100) NOT NULL,
	`iddesk` int(11) DEFAULT NULL,
	`ruta` varchar(100) DEFAULT NULL,
	PRIMARY KEY (`idweb`),
	UNIQUE KEY `iddesk_UNIQUE` (`iddesk`),
	KEY `fk_uinal_categoria1_idx` (`categoria`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--
-- Volcado de datos para la tabla `uinal`
--
INSERT INTO
	`uinal` (
		`idweb`,
		`nombre`,
		`significado`,
		`dias`,
		`htmlCodigo`,
		`categoria`,
		`iddesk`,
		`ruta`
	)
VALUES
	(
		0,
		'Wayeb\'',
		'Dias desafortunados, reflexion, gracia y penitencia',
		5,
		'<p>Cuando llegaban los cinco días sin nombre conocidos como <strong>uayeb</strong>, los mayas no se bañaban, no hacían obras serviles o de trabajo, porque temían que al realizar alguna actividad, les iría mal.</p>',
		'Uinal_0',
		18,
		'src/imagenesWinales/19.png'
	),
	(
		1,
		'Pop',
		'Mat (símbolo de comunidad y matrimonio), petate',
		20,
		'<p>Este mes era una especie de año nuevo, era una fiesta muy celebrada, renovaban todas las cosas de utensilios de casa, como platos, vasos, banquillos, ropa, mantillas, barrían su casa y la asura la echaban fuera del pueblo, pero antes de la fiesta al menos <strong>13 </strong>días ayunaban y se abstenían de tener sexo, no comían sal, ni chile, algunas personas ampliaban este período de abstinencia  hasta tres uinales. Después todos los hombres se reunían con el sacerdote en el patio del templo y ponían una porción de copal en el brasero para quemarlo.</p>',
		'Uinal_1',
		0,
		'src/imagenesWinales/1.png'
	),
	(
		2,
		'Woo',
		'Rana, sapo, negro',
		20,
		'<p>En este mes se realizaban festividades para sacerdotes, adivinadores, la ceremonia era llamada pocam, y oraban quemando copal a Kinich Ahau Itzamná, a quien consideraban el primer sacerdote. Con <em><strong>«agua virgen traída del monte, donde no llegase mujer»</strong></em> untaban las tablas de los libros y el sacerdote realizaba los pronósticos del año, realizaban un baile llamado okotuil.</p>',
		'Uinal_2',
		1,
		'src/imagenesWinales/2.png'
	),
	(
		3,
		'Zip',
		'Rojo, conjuncion',
		20,
		'<p>En este mes se juntaban los sacerdotes con sus mujeres, y usaban idolillos de la diosa <strong>Ixchel</strong>, y la fiesta se llamaba<strong> Ibcil Ixchel</strong>, invocaban a los dioses de la medicina que eran <strong>Itzamná</strong>, <strong>Citbolontun </strong>y <strong>Ahau Chamahez</strong>, realizaban un baile llamado Chantunyab. El día siete del uinal zip día invocaban a los dioses de la caza <strong>Ah Cancum, Zuhuyzib Zipitabai</strong>, y otros, cada cazador sacaba una flecha y una cabeza de venado las cuales eran untadas de betún azul, y bailaban con las flechas en las manos, se horadaban las orejas, otros la lengua y pasaban por los agujeros siete hojas de una hierba llamada <strong>Ac</strong>. Al día siguiente era el turno de los pescadores, pero ellos untaban de betún azul sus aparejos de pesca y no se horadaban las orejas, sino que se ponían arpones, y bailaban el <strong>Chohom</strong>, y después de realizada la ceremonia iban a la costa a pescar, los dioses eran <strong>Abkaknexoi, Abpua, y Ahcitzamalcun</strong>.</p>',
		'Uinal_3',
		2,
		'src/imagenesWinales/3.png'
	),
	(
		4,
		'Sotz\'',
		'Bat (murcielago)',
		20,
		'<p>En este mes los apicultores comenzaban los preparativos pero celebraban su fiesta en el uinal siguiente <strong>tsek</strong>, los sacerdotes y oficiales ayunaban, así como algunos voluntarios.</p>',
		'Uinal_4',
		3,
		'src/imagenesWinales/4.png'
	),
	(
		5,
		'Tzek',
		'Fin, palma, calavera',
		20,
		'<p>En este mes no derramaban <strong>sangre</strong>, los dioses venerados eran los cuatro <strong>bacabs</strong>, especialmente <strong>Hobnil</strong>. Ofrecían a los <strong>bacabs </strong>platos con figuras de miel, y los mayas bebían un vino llamado balche, el cual se procesaba de la corteza del árbol de ese nombre<em> (Lonchucarpus violaceus)</em>, los apicultores regalaban miel en abundancia.</p>',
		'Uinal_5',
		4,
		'src/imagenesWinales/5.png'
	),
	(
		6,
		'Xul',
		'Perro, instrumento musical',
		20,
		'<p>Este mes era dedicado a <strong>Kukulcán</strong>, los mayas iban por el jefe supremo de los guerreros llamado <strong>Nacom</strong>, al cual sentaban en el templo quemando copal, realizaban un baile de guerreros llamado <strong>Holkanakot</strong>, sacrificando un perro y quebrando ollas llenas de bebida para terminar su fiesta, y regresar con honores al <strong>Nacom </strong>a su casa. Esta ceremonia se celebraba en todos lados hasta la destrucción de <strong>Mayapán</strong>, después solo se celebraba en Maní en la jurisdicción de los <strong>Tutul xiúes</strong>, todos los señores se juntaban presentaban cinco banderas de pluma, y se iban al templo de <strong>Kukulcán</strong>, donde oraban durante cinco días, después de los cuales bajaba <strong>Kukulcán </strong>del cielo y recibía las ofrendas, la fiesta se llamaba <strong>Chikabán</strong>.</p>',
		'Uinal_6',
		5,
		'src/imagenesWinales/6.png'
	),
	(
		7,
		'Yaxk\'in',
		'Primer Sol (o verde), inicio agricola, nuevo dia',
		20,
		'<p>En este mes se realizaba la ceremonia se llamaba <strong>Olob-Zab-Kamyax</strong>, se untaban todos los instrumentos de todos los oficios con betún azul, se juntaban los niños y las niñas del pueblo y les daban unos golpecillos en los nudillos, con la idea que los niños fueran expertos en los oficios de sus padres. Desde este uinal comenzaban a aparejarse para la ceremonia del uinal <strong>Mol</strong>.</p>',
		'Uinal_7',
		6,
		'src/imagenesWinales/7.png'
	),
	(
		8,
		'Mol',
		'Inicio de lluvia, agua, jade',
		20,
		'<p>En este mes los apicultores oraban a los dioses para que hubiese buenas flores y de esta manera tener una buena producción de las abejas,.en este mes era cuando fabricaban las <strong>efigies </strong>o ídolos de madera, los cuales eran de alguna forma bendecidos por los sacerdotes. Se practicaba un ritual en el cual se<em> sangraban las orejas.</em></p>',
		'Uinal_8',
		7,
		'src/imagenesWinales/8.png'
	),
	(
		9,
		'Ch\'en',
		'Lluvia, negro, acido',
		20,
		'<p>En este mes hacían una fiesta llamaba <strong>ocná</strong>, que quiere decir <em>«renovación del templo»</em>, la hacían en honor de los dioses de los maizales; los mayas acostumbraban tener ídolos de los dioses con pequeños braseros en donde quemaban copal, en esta fiesta cada año se renovaban los ídolos de barro y sus braseros.</p>',
		'Uinal_9',
		8,
		'src/imagenesWinales/9.png'
	),
	(
		10,
		'Yax',
		'Verde, humedad',
		20,
		'<p>En este mes hacían una fiesta llamaba <strong>ocná</strong>, que quiere decir <em>«renovación del templo»</em>, la hacían en honor de los dioses de los maizales; los mayas acostumbraban tener ídolos de los dioses con pequeños braseros en donde quemaban copal, en esta fiesta cada año se renovaban los ídolos de barro y sus braseros.</p>',
		'Uinal_10',
		9,
		'src/imagenesWinales/10.png'
	),
	(
		11,
		'Sak',
		'Blanco, lluvia',
		20,
		'<p>En este mes el sacerdote y los cazadores hacían una ceremonia para aplacar a los dioses de la ira, y como una forma de penitencia por la sangre derramada durante la cazas (los mayas tenían como <em>«cosa horrenda»</em> cualquier derramamiento de sangre si dicho derramamiento no era en sus sacrificios), por eso cuando iban a la caza invocaban al dios de la caza, le quemaban copal y si podían le untaban al rostro del ídolo de la caza, la sangre del corazón de la presa.</p>',
		'Uinal_11',
		10,
		'src/imagenesWinales/11.png'
	),
	(
		12,
		'Keh',
		'Rojo, venado',
		20,
		'<p>En las proximidades de este mes existía una fiesta muy grande y de fecha movible que duraba tres días, con quema de copal, a la cual Landa llamaba <strong><em>«sahumerías»</em></strong>, ofrendas y borrachera. Los sacerdotes tenían cuidado de avisar con tiempo para realizar un ayuno previo</p>',
		'Uinal_12',
		11,
		'src/imagenesWinales/12.png'
	),
	(
		13,
		'Mak',
		'Red, cautiverio, pecado',
		20,
		'<p>En este mes la gente anciana realizaba una ceremonia llamada <strong>«tupp kak»</strong> <em>(matar el fuego)</em>, era dirigida a los dioses de los panes y a Itzamná, en una fogata quemaban corazones de aves y animales, una vez incinerados los corazones apagaban el fuego con cántaros de agua. Se juntaba el pueblo y los sacerdotes y untaban con lodo y betún azul los primeros escalones de las escaleras de sus templos. En esta fiesta no realizaban ayuno, a excepción del sacerdote</p>\n',
		'Uinal_13',
		12,
		'src/imagenesWinales/13.png'
	),
	(
		14,
		'K\'ank\'in',
		'Sol amarillo',
		20,
		'<p>Hasta la fecha se desconocen los <em>dioses </em>que se honraban en este periodo del año maya</p>',
		'Uinal_14',
		13,
		'src/imagenesWinales/14.png'
	),
	(
		15,
		'Muwan',
		'Halcon, buho',
		20,
		'<p>Este mes correspondía a los cultivadores de cacao realizar una ceremonia a los dioses <strong>Chac Ek chuah, </strong>y<strong> Hobnil</strong>, sacrificaban un perro manchado con el color de cacao, y quemaban incienso y ofrecían iguanas de las azules<em> (probablemente untadas de betún azul)</em> y ciertas plumas de pájaros, terminada la ceremonia los mayas se comían las ofrendas.</p>',
		'Uinal_15',
		14,
		'src/imagenesWinales/15.png'
	),
	(
		16,
		'Pax',
		'Tiempo de siembra, tambor, musica',
		20,
		'<p>En este mes la ceremonia se llamaba<strong> pacum chac</strong>, y por un período de cinco noches se juntaban los señores <em>(batab)</em> y los sacerdotes (ah kin) de los pueblos menores <em>(batabil)</em>, en las capitales y veneraban a <strong>Cit chac cob</strong>. Se homenajeaba con copal al jefe de los guerreros <em>(nacom)</em> durante cinco días, realizaban un baile de los guerreros llamado <strong>HOLKANAKOT</strong>. El sentido de esta ceremonia era para pedir a sus dioses alcanzar la victoria frente a sus enemigos. Se sacrificaba un perro, al cual se le extraía el corazón, se rompían ollas grandes que contenían bebida, y daban por finalizada la ceremonia, regresando a sus pueblos.</p>',
		'Uinal_16',
		15,
		'src/imagenesWinales/16.png'
	),
	(
		17,
		'K\'ayab\'',
		'Tortuga, guacamaya',
		20,
		'<p>Durante los meses <strong>kayab </strong>y <strong>Kumku </strong>en cada población hacían fiestas a las cuales llamaban <strong>zabacilthan</strong>, se reunían para presentar ofrendas, comer y beber preparándose para el <strong><em>uayeb</em></strong>, el mes corto de los cinco días nefastos. </p>',
		'Uinal_17',
		16,
		'src/imagenesWinales/17.png'
	),
	(
		18,
		'K\'umk\'u\'',
		'Maiz maduro, granero, oscuridad',
		20,
		'<p>Durante los meses <strong>kayab </strong>y <strong>Kumku </strong>en cada población hacían fiestas a las cuales llamaban <strong>zabacilthan</strong>, se reunían para presentar ofrendas, comer y beber preparándose para el <strong><em>uayeb</em></strong>, el mes corto de los cinco días nefastos. </p>',
		'Uinal_18',
		17,
		'src/imagenesWinales/18.png'
	);

--
-- Restricciones para tablas volcadas
--
-- table periodo
--
-- Estructura de tabla para la tabla `periodo`
--
DROP TABLE IF EXISTS `periodo`;

CREATE TABLE `periodo` (
	`orden` int DEFAULT NULL,
	`nombre` varchar(50) NOT NULL,
	`fechaInicio` varchar(5) NOT NULL,
	`fechaFin` varchar(5) NOT NULL,
	`ACInicio` varchar(3) DEFAULT NULL,
	`ACFin` varchar(3) DEFAULT NULL,
	`descripcion` varchar(250) DEFAULT NULL,
	`htmlCodigo` longtext,
	`categoria` varchar(100) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- table periodo
-- inserts into periodo
INSERT INTO
	`periodo` (
		`orden`,
		`nombre`,
		`fechaInicio`,
		`fechaFin`,
		`ACInicio`,
		`ACFin`,
		`descripcion`,
		`htmlCodigo`,
		`categoria`
	)
VALUES
	(
		2,
		'Clasico',
		'292',
		'900',
		'D.C',
		'D.C',
		'<p>Las tierras bajas del centro y del sur alcanzaron su máximo esplendor. Durante el periodo clásico surgen en la sociedad maya los artesanos, arquitectos, pintores y artistas canteros, especialistas en la producción y en el servicio.</p>',
		NULL,
		'Clasico'
	),
	(
		3,
		'PosClasico',
		'900',
		'1541',
		'D.C',
		'D.C',
		'<p>Durante el periodo posclásico los mayas orientaron más sus energías a la producción y el comercio y menos a la monumentalidad de sus construcciones. </p>',
		NULL,
		'PosClasico'
	),
	(
		1,
		'PreClasico',
		'1500',
		'292',
		'A.C',
		'D.C',
		'<p>Las primeras manifestaciones de vida sedentaria en el área maya se desarrollaron en la región Costa del Pacífico y del Piamonte y corresponden al periodo preclásico.</p>',
		'<p>El período <strong>Preclásico Temprano</strong> indica el momento en que las sociedades mayas contaron con rasgos culturales propios que los distinguen de otros grupos mesoamericanos. Las sociedades son ya aldeas agrícolas sedentarias, por lo que aparece por primera vez la cerámica. En la Costa Pacífica este período inicia alrededor del año 1,800 a.C., pero en el resto del área Maya se define a partir del 1,000 o 1,200 a.C.</p>',
		'PreClasico'
	);

-- inserts into periodo
--
-- Filtros para la tabla `energia`
--
ALTER TABLE
	`energia`
ADD
	CONSTRAINT `fk_energia_categoria1` FOREIGN KEY (`categoria`) REFERENCES `categoria` (`nombre`);

--
-- Filtros para la tabla `kin`
--
ALTER TABLE
	`kin`
ADD
	CONSTRAINT `fk_kin_categoria1` FOREIGN KEY (`categoria`) REFERENCES `categoria` (`nombre`);

--
-- Filtros para la tabla `nahual`
--
ALTER TABLE
	`nahual`
ADD
	CONSTRAINT `fk_nahual_categoria1` FOREIGN KEY (`categoria`) REFERENCES `categoria` (`nombre`);

--
-- Filtros para la tabla `pagina`
--
ALTER TABLE
	`pagina`
ADD
	CONSTRAINT `FK_PAGINA_CATG` FOREIGN KEY (`categoria`) REFERENCES `categoria` (`nombre`);

--
-- Filtros para la tabla `uinal`
--
ALTER TABLE
	`uinal`
ADD
	CONSTRAINT `fk_uinal_categoria1` FOREIGN KEY (`categoria`) REFERENCES `categoria` (`nombre`);


CREATE TABLE IF NOT EXISTS `cruz` (
  `nacimiento`     INT       NOT NULL,
  `izquierdo`      INT       NOT NULL,
  `derecho`        INT       NOT NULL,
  `destino`        INT       NOT NULL,
  `concepcion`     INT       NULL,
  PRIMARY KEY (`nacimiento`),
  FOREIGN KEY (`nacimiento`)  REFERENCES `nahual` (`idweb`),
  FOREIGN KEY (`izquierdo`)   REFERENCES `nahual` (`idweb`),
  FOREIGN KEY (`derecho`)     REFERENCES `nahual` (`idweb`),
  FOREIGN KEY (`destino`)     REFERENCES `nahual` (`idweb`),
  FOREIGN KEY (`concepcion`)  REFERENCES `nahual` (`idweb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Poblamos con tus valores
INSERT INTO `cruz` (
  `nacimiento`, `concepcion`, `destino`, `izquierdo`, `derecho`
) VALUES
  (14, 6,  2,  8,  0),
  (15, 7,  3,  9,  1),
  (16, 8,  4,  2, 10),
  (17, 9,  5, 11,  3),
  (18,10,  6, 12,  4),
  (19,11,  7, 13,  5),
  ( 0,12,  8, 14,  6),
  ( 1,13,  9,  0, 14),
  ( 2,14, 10, 16,  8),
  ( 3,15, 11, 17,  9),
  ( 4,16, 12, 18, 10),
  ( 5,17, 13, 19, 11),
  ( 6,18, 14,  0, 12),
  ( 7,19, 15,  1, 13),
  ( 8, 0, 16,  2, 14),
  ( 9, 1, 17,  3, 15),
  (10, 2, 18,  4, 16),
  (11, 3, 19,  5, 17),
  (12, 4,  0,  6, 18),
  (13, 5,  1,  7, 19);

CREATE TABLE IF NOT EXISTS `animal_guia` (
  `idweb_nahual` INT       NOT NULL,
  `animal`       VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idweb_nahual`),
  FOREIGN KEY (`idweb_nahual`) REFERENCES `nahual` (`idweb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `animal_guia` (`idweb_nahual`, `animal`) VALUES
  (14, 'El Tiburón'),
  (15, 'El Perro'),
  (16, 'El Mono'),
  (17, 'El Gato'),
  (18, 'El Armadillo'),
  (19, 'El Jaguar'),
  ( 0, 'El Águila'),
  ( 1, 'La Abeja'),
  ( 2, 'El Pájaro Carpintero'),
  ( 3, 'El Tucán'),
  ( 4, 'La Tortuga'),
  ( 5, 'El Humano'),
  ( 6, 'El Cocodrilo'),
  ( 7, 'El Colibrí'),
  ( 8, 'La Guacamaya'),
  ( 9, 'La Araña'),
  (10, 'La Serpiente'),
  (11, 'El Búho'),
  (12, 'El Venado'),
  (13, 'El Conejo');

ALTER TABLE `animal_guia` RENAME COLUMN `nombre` TO `animal`; 

COMMIT;