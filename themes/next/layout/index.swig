{% extends '_layout.swig' %}
{% import '_macro/post.swig' as post_template %}
{% import '_macro/sidebar.swig' as sidebar_template %}

{% block title %}{{ title }}{% if theme.index_with_subtitle and subtitle %} – {{ subtitle }}{% endif %}{% endblock %}

{% block page_class %}
  {% if is_home() %}page-home{% endif -%}
{% endblock %}

{% block content %}

  {% if theme.giteement.enable %}
  <script src="https://gitee.com/wugenqiang/giteement/raw/master/dist/oauthcallback.browser.js"></script>
  <script>
    Oauthcallback();
  </script>
  {% endif %}
  <section id="posts" class="posts-expand">

    {% for post in page.posts %}
      {% set hide = false %}
      {% if theme.hide.hide_post %}
        {% if post.hide %}
          {% set hide = true %}
        {% endif %}
      {% endif %}
      {% if !hide %}
        {{ post_template.render(post, true) }}
      {% endif %}
    {% endfor %}

  </section>

  {% include '_partials/pagination.swig' %}
{% endblock %}

{% block sidebar %}
  {{ sidebar_template.render(false) }}
{% endblock %}
