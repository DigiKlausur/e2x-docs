.. _e2xgrader-installation:

*****************************************
E2xgrader Installation
*****************************************

The e2xgrader package needs some nbgrader functionality,
that has not been merged yet. For now you can use the 
branch *clean_up* of our `nbgrader fork`_.
It needs the custom exchange and configurable converters.

Install nbgrader

.. code-block:: bash

   git clone -b clean_up https://github.com/DigiKlausur/nbgrader.git
   cd nbgrader
   pip install .

Enable nbgrader extensions

.. code-block:: bash

   jupyter serverextension enable nbgrader.server_extensions.course_list --py --sys-prefix
   jupyter serverextension enable nbgrader.server_extensions.validate_assignment --py --sys-prefix
   jupyter nbextension install nbgrader --py --sys-prefix --overwrite
   jupyter nbextension enable nbgrader --py --sys-prefix
   jupyter nbextension disable create_assignment/main --sys-prefix


Install e2xgrader

.. code-block:: bash

   git clone https://github.com/DigiKlausur/e2xgrader
   cd e2xgrader
   pip install .

Enable e2xgrader extensions


.. code-block:: bash

   jupyter serverextension enable e2xgrader --py --sys-prefix
   jupyter nbextension install e2xgrader --py --sys-prefix --overwrite
   jupyter nbextension enable e2xgrader --py --sys-prefix

.. _nbgrader fork: https://github.com/DigiKlausur/nbgrader/tree/clean_up