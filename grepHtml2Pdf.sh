#!/bin/bash
rm ~/Dokumente/jsptutorial*.pdf
html2pdf http://www.jsptutorial.org ~/Dokumente/jsptutorial-00.pdf
html2pdf http://www.jsptutorial.org/content/introduction   ~/Dokumente/jsptutorial-01.pdf
html2pdf http://www.jsptutorial.org/content/differentiation ~/Dokumente/jsptutorial-02.pdf
html2pdf http://www.jsptutorial.org/content/lifecycle      ~/Dokumente/jsptutorial-03.pdf
html2pdf http://www.jsptutorial.org/content/tomcat         ~/Dokumente/jsptutorial-04.pdf
html2pdf http://www.jsptutorial.org/content/syntax         ~/Dokumente/jsptutorial-07.pdf
html2pdf http://www.jsptutorial.org/content/directory/Structure      ~/Dokumente/jsptutorial-08.pdf
html2pdf http://www.jsptutorial.org/content/implicitObjects          ~/Dokumente/jsptutorial-09.pdf
html2pdf http://www.jsptutorial.org/content/clientRequests           ~/Dokumente/jsptutorial-10.pdf
html2pdf http://www.jsptutorial.org/content/beans                    ~/Dokumente/jsptutorial-11.pdf
html2pdf http://www.jsptutorial.org/content/standardActions          ~/Dokumente/jsptutorial-12.pdf
html2pdf http://www.jsptutorial.org/content/errorHandling            ~/Dokumente/jsptutorial-14.pdf
html2pdf http://www.jsptutorial.org/content/architecture             ~/Dokumente/jsptutorial-15.pdf
html2pdf http://www.jsptutorial.org/content/firstExampleIntro        ~/Dokumente/jsptutorial-16.pdf
html2pdf http://www.jsptutorial.org/content/session      ~/Dokumente/jsptutorial-17.pdf
html2pdf http://www.jsptutorial.org/content/el           ~/Dokumente/jsptutorial-18.pdf
html2pdf http://www.jsptutorial.org/content/jstl         ~/Dokumente/jsptutorial-19.pdf
html2pdf http://www.jsptutorial.org/content/internationalization      ~/Dokumente/jsptutorial-20.pdf
html2pdf http://www.jsptutorial.org/content/filter       ~/Dokumente/jsptutorial-22.pdf
html2pdf http://www.jsptutorial.org/content/appendix_I      ~/Dokumente/jsptutorial-23.pdf
html2pdf http://www.jsptutorial.org/content/appendix_II      ~/Dokumente/jsptutorial-24.pdf
pdftk ~/Dokumente/jsptutorial*.pdf output ~/Dokumente/jsptutorial.pdf























