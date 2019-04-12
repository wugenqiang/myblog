{% extends '_layout.swig' %}
{% import '_macro/post-collapse.swig' as post_template %}
{% import '_macro/sidebar.swig' as sidebar_template %}

{% block title %}{{ page.title }} | {{ config.title }}{% endblock %}

{% block content %}

  {#################}
  {### Photo BLOCK ###}
  {#################}
  <div class="post-block photo">

    <div id="posts" class="posts-collapse">

    </div>

  </div>

  {#####################}
  {### END Photo BLOCK ###}
  {#####################}

  {% include '_partials/pagination.swig' %}
{% endblock %}

{% block sidebar %}
  {{ sidebar_template.render(false) }}
{% endblock %}
