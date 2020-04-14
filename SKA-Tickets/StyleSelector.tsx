import React, { Component } from "react";

import "./StyleSelector.css";
import "./DeviceSuggester.css";
import { camelCase } from "lodash";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";

/*
background-image:url("https://www.pe.com/wp-content/uploads/2018/01/rpe-bus-bestlaw-warning.jpg");
background-size:30%;
background-position:left;
padding-left: 30px;
background-repeat: no-repeat;
color:orange;
font-decoration:underline;
*/ 

interface Props {
  onChange: (parsedCss: string) => void;
  value: string;
}
interface State {
  errors: string[];
  collapsed: boolean;
}

export default class DeviceSuggester extends Component<Props, State> {
  public constructor(props: Props) {
    super(props);
    this.state = { errors: [], collapsed: !props.value }; //make custom css expanded on mount iff widget has custom css
  }
  public componentDidMount() {
    const { errors } = parseCss(this.props.value);
    this.setState({ errors });
  }
  public render() {
    const { errors, collapsed } = this.state;
    const collapseIcon = collapsed ? "angle-down" : "angle-up";
    return (
      <>
        <div>
          <div
            style={{ display: "block", cursor: "pointer" }}
            onClick={e => this.setState({ collapsed: !this.state.collapsed })}
          >
            Custom css (advanced)
            <FontAwesomeIcon
              style={{ marginLeft: "0.5em" }}
              title={`Hide the custom css`}
              icon={collapseIcon}
            />
          </div>
        </div>
        {!collapsed && (
          <>
            <textarea
              className="form-control"
              rows={5}
              value={this.props.value}
              placeholder={
                "Applied to container <div> element. One statement per line."
              }
              onChange={e => this.props.onChange(this.validate(e.target.value))}
            />
            {errors.length > 0 && (
              <div className="errors">
                <span>Invalid css:</span>
                {errors.map(error => (
                  <div className="error">{error}</div>
                ))}
              </div>
            )}
          </>
        )}
      </>
    );
  }
  validate = (raw: string) => {
    const { errors } = parseCss(raw);
    this.setState({ errors });
    return raw;
  };
}
export function parseCss(raw: string) {
  const css = {};
  const errors: string[] = [];
  if (!(typeof raw === "string")) {
    return { data: {}, errors: [] };
  }
  if (raw.trim().length === 0) {
    return { data: {}, errors: [] };
  }
  raw.split("\n").forEach(statement => {
    try {
      if (statement.trim().length > 0) 
      {
        const kebabKey = statement
          .trim()
          .split(":")[0]
          .trim();
        const key = camelCase(kebabKey);
        const value = statement
          .trim()
          .replace(kebabKey,"")
          .replace(":","")
          .replace(";", "");
        //basic validation
        if (!value.trim()) { //has value
          errors.push(statement);
        } else if (!key.trim()) { //has key
          errors.push(statement);
        } else if (kebabKey.indexOf(" ") !== -1) { //no whitespace in key (before camelCasing)
          errors.push(statement);
        } else {
          css[key] = value;
        }
      }
    } catch (e) {
      errors.push(statement);
    }
  });
  return { data: css, errors };
}
