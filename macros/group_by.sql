{% macro group_by(n) %}
    GROUP BY
        {% for i in range(1, n + 1) %} 
            {{ i }}
            {% if not loop.last %} , {% endif %}
        {% endfor %}
{% endmacro %}

-- GROUP BY 1, 2, 3, 4, 5

