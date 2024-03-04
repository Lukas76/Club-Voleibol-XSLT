<?xml version="1.0" encoding="UTF-8"?>
<!--
	Modulo: LMSGI
	UD: 04
	Fecha: 04/03/2024
	Autor: Lucas Arrospide Jauregui
	Tarea: Tarea evaluativa 2. XSLT
	Enunciado:El objetivo de esta tarea es utilizar el lenguaje XPath
	 y el estandar XSLT para transformar un sitio web 
	 de manera que obtenga los datos visualizados de un documento XML.
	Autoebaluacion: 
-->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >

<xsl:output method="html" doctype-system="about:legacy-compat"/>

<xsl:template match='club_voleibol'>

<html lang="es"> 

    <head>

        <link href="../css/estilo.css" rel="stylesheet" type="text/css"/>

        <meta charset="utf-8"/>

        <meta name="description" content="Página principal"/> 

        <title>titulo de la web</title>    

    </head>

    <body>

        <header>

            <img src= "../img/logotipo.png" alt= "Reservas" />

            <a href="tienda.xml">Tienda</a>

            <a href="equipos.xml">Equipos</a>

            <a href="partidos.xml">Partidos</a>        

        </header>      
                                             
        <main class="principal">

            <!-- Seleccionamos los articulos que queremos mostrar y les aplicamos la plantilla correspondiente -->
            <xsl:apply-templates select="tienda/articulo"/>               

        </main>

        <footer>

            <address>&#169; Desarrollado por info@birt.eus</address>

        </footer>

    </body>

</html>  

</xsl:template>

<!-- Plantilla para los articulos -->
<xsl:template match="tienda/articulo">

    <article>
        <section>
            <!-- Seleccionamos la foto del articulo y le aplicamos un estilo -->
            <img class="articulo" src="../img/{@foto}"/>                                             

        </section>

        <section>                                          
            <!-- Mostramos el precio de la ruta y le adjuntamos el signo del Euro -->
            <h2><xsl:value-of select="precio"/> €</h2>

             <!-- Mostramos el numero de comentarios -->
            <h3>Comentarios: <xsl:value-of select="count(comentarios)"/></h3>

            <ul>
                 <!-- Seleccionamos los comentarios que queremos mostrar y les aplicamos la plantilla correspondiente -->
                <xsl:apply-templates select="comentarios"/>
            </ul>

        </section>                                      
    </article>

</xsl:template>

<!-- Plantilla para los comentarios -->
<xsl:template match="comentarios">

    <!-- Devolvera los comentarios del nodo actual -->
    <li><xsl:value-of select="."/></li>

</xsl:template>
</xsl:stylesheet>

