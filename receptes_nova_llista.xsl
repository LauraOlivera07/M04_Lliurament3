<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8"/>
    <xsl:template match="/recetas">

        <html lang="es">
            <head>
                <meta charset="UTF-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <title>Llista de receptes</title>
                <link rel="stylesheet" href="aesthetic.css"/>
            </head>
            <body>
                <header>
                    <div class="logo">
                        <img src="Logo-Delicias.png" alt="Delicias Kitchen Logo"/>
                    </div>
                    <nav>
                        <a href="index.html">INICIO</a>
                        <a href="construccio.html">SOBRE MÍ</a>
                        <a href="nova_llistareceptes.html">RECETAS</a>
                        <a href="formulari.html">CONTACTO</a>
                        <a href="construccio.html">OTRAS COSAS</a>
                    </nav>
                </header>

                <main>
                    <div class="breadcrumb" style="margin-top: 0%;">
                        <a href="index.html">Inicio</a> &#187; <span>Recetas</span>
                    </div>

                    <section class="seccio">
                        <h1>Recetas</h1>
                    </section>

                    <div class="recipe-list">
                        <xsl:for-each select="recepta">  
                            <div class="recipe">
                                <h2><xsl:value-of select="nom"/></h2>
                                <ul>
                                    <xsl:for-each select="temps/*">
                                        <p>
                                            <strong>
                                                 <xsl:choose>
                                                    <xsl:when test="name() = 'preparacio'">Preparación</xsl:when>
                                                    <xsl:when test="name() = 'coccio'">Cocción</xsl:when>
                                                    <xsl:when test="name() = 'total'">Total</xsl:when>
                                                    <xsl:when test="name() = 'racions'">Raciones</xsl:when>
                                                    <xsl:when test="name() = 'dificultat'">Dificultad</xsl:when>
                                                    <xsl:otherwise>
                                                        <xsl:value-of select="name()"/>
                                                    </xsl:otherwise>
                                                </xsl:choose>:
                                            </strong>
                                            <xsl:value-of select="."/>
                                        </p>
                                    </xsl:for-each>
                                </ul>
                                <img>
                                    <xsl:attribute name="src">
                                        <xsl:text>fotos_recetas/</xsl:text>
                                        <xsl:value-of select="imagen"/>
                                        <xsl:text>.jpg</xsl:text>
                                    </xsl:attribute>
                                    <xsl:attribute name="alt">
                                        <xsl:value-of select="nom"/>
                                    </xsl:attribute>
                                     <xsl:attribute name="style">
                                        <xsl:text>width: 200px; height: 200px; object-fit: cover;</xsl:text>
                                    </xsl:attribute>
                                </img>
                                <a href="receta{string(@id)}.html" class="link">Ver receta</a>
                                
                            </div>
                        </xsl:for-each>
                    </div>

                    <div class="pagination">
                        <button class="page-btn" disabled="disabled">&#171;</button>
                        <button class="page-btn active">1</button>
                        <button class="page-btn">2</button>
                        <button class="page-btn">3</button>
                        <button class="page-btn">&#187;</button>
                    </div>

                </main>

                <footer>
                    <ul>
                        <li><a href="#">Facebook</a></li>
                        <li><a href="#">Twitter</a></li>
                        <li><a href="#">Instagram</a></li>
                        <li><a href="#">Email</a></li>
                        <li><a href="#">RSS</a></li>
                    </ul>
                </footer>
            </body>
        </html>

    </xsl:template>
</xsl:stylesheet>
